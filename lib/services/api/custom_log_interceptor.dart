import 'package:dio/dio.dart';
import 'package:pont/utils/logs/log.dart';

const _tag = 'custom_log_interceptor';

class CustomLogInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Log.d(
      _tag,
      'onRequest: ${options.method} ${options.uri}, params = ${options.queryParameters}, headers = ${options.headers}, data = ${options.data}',
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Log.d(
      _tag,
      'onResponse: ${response.requestOptions.method} ${response.requestOptions.uri}, headers = ${response.headers}, statusCode = ${response.statusCode}, response = $response',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Log.e(
      _tag,
      'onError: ${err.requestOptions.method} ${err.response?.requestOptions.uri}, headers = ${err.response?.headers}, statusCode = ${err.response?.statusCode}, response = ${err.response}\nerr = $err',
    );
    super.onError(err, handler);
  }
}
