import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pont/data/serializers.dart';
import 'package:pont/data/server/response/get_items_by_owner_address_response.dart';
import 'package:pont/services/api/custom_log_interceptor.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf_io;

const _tag = 'api_service';

/// https://tonapi.io/docs/
class ApiService {
  static const _apiBaseUrl = 'https://tonapi.io/v1/nft/';
  static const _apiKey =
      'eyJhbGciOiJFZERTQSIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsib3RvcGJhMSJdLCJleHAiOjE4MTQyOTQyNjEsImlzcyI6IkB0b25hcGlfYm90IiwianRpIjoiVk4yRjRaRkxRSVdaM1VDUkZCQVJaNURSIiwic2NvcGUiOiJjbGllbnQiLCJzdWIiOiJ0b25hcGkifQ.O7tgneJWUOg9We26mzWShgXHpaRrPa8F5FECSRTVTIhlcBwOJg2_ZrVBRIrtFMYY7EwP14kcFoRGucFstWBmCQ';
  late final Dio _dio;

  static const _defaultIp = '127.0.0.1';
  static const _defaultPort = 8080;
  late final HttpServer _server;

  ApiService() {
    _init();
  }

  Future<void> _init() async {
    Log.d(_tag, '_init');

    _dio = Dio(
      BaseOptions(
        baseUrl: _apiBaseUrl,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $_apiKey'},
      ),
    );

    _dio.interceptors.add(CustomLogInterceptor());

    final handler = const shelf.Pipeline()
        .addMiddleware(shelf.logRequests(logger: _logServer))
        .addHandler(_onServerRequest);

    _server = await shelf_io.serve(handler, _defaultIp, _defaultPort);
    Log.d(
      _tag,
      'Start server at http://${_server.address.host}:${_server.port}',
    );
    _server.autoCompress = true;
  }

  Future<shelf.Response> _onServerRequest(shelf.Request request) async {
    return shelf.Response(418);
  }

  void _logServer(String message, bool isError) {
    if (isError) {
      Log.e(_tag, '_logServer: $message');
    } else {
      Log.d(_tag, '_logServer: $message');
    }
  }

  Future<GetItemsByOwnerAddressResponse> getItemsByOwnerAddress(
    String address,
  ) async {
    Log.d(_tag, 'getItemsByOwnerAddress: address = $address');

    final result = await _dio.get(
      'getItemsByOwnerAddress',
      queryParameters: {
        'account': address,
      },
    );

    Log.d(_tag, 'getItemsByOwnerAddress: result = ${result.data}');

    return deserialize<GetItemsByOwnerAddressResponse>(result.data)!;
  }
}
