import 'package:pont/services/crashlytics/console_crashlytics_service.dart';

abstract class CrashlyticsService {
  static CrashlyticsService instance = ConsoleCrashlyticsService();

  Future<void> init();

  void onError(Object e, {StackTrace? stackTrace});

  void recordHandledError(
    HandledError error, {
    StackTrace? stackTrace,
  });
}

class HandledError extends Error {
  HandledError(this.message);

  final String message;

  @override
  String toString() => 'HandledError: $message';
}
