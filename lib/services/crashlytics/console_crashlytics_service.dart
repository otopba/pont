import 'package:flutter/material.dart';
import 'package:pont/services/crashlytics/crashlytics_service.dart';
import 'package:pont/utils/logs/log.dart';

const _tag = 'console_crashlytics_service';

class ConsoleCrashlyticsService implements CrashlyticsService {
  @override
  Future<void> init() async {
    FlutterError.onError = (details) {
      Log.e(
        _tag,
        'FlutterError.onError: ${details.exceptionAsString()}\n${details.stack}',
      );
    };
  }

  @override
  void onError(Object e, {StackTrace? stackTrace}) {
    Log.e(_tag, 'onError: $e\n$stackTrace');
  }

  @override
  void recordHandledError(
    HandledError error, {
    StackTrace? stackTrace,
  }) {
    Log.e(_tag, 'recordHandledError: $error\n$stackTrace');
  }
}
