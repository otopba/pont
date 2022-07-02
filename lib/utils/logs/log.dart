import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:pont/build_options.dart';
import 'package:pont/utils/logs/file_logger.dart';
import 'package:pont/utils/logs/mock_file_logger.dart';
import 'package:pont/utils/logs/real_file_logger.dart';
import 'package:rxdart/rxdart.dart';

enum LogLevel {
  d,
  w,
  e,
}

typedef LogPrinter = void Function(LogItem item);

class Log {
  static late final List<LogPrinter> _logPrinters = [];
  static late final FileLogger _fileLogger =
      flutterTestRunning || !buildConfig.logsEnabled
          ? MockFileLogger()
          : RealFileLogger();
  static final _logSubject = PublishSubject<LogItem>();

  static Stream<LogItem> get logStream => _logSubject;

  static void addLogPrinter(LogPrinter logPrinter) {
    _logPrinters.add(logPrinter);
  }

  static void d(String tag, Object? message) {
    log(LogLevel.d, tag, message);
  }

  static void w(String tag, Object? message) {
    log(LogLevel.w, tag, message);
  }

  static void e(String tag, Object? message, {StackTrace? stackTrace}) {
    log(LogLevel.e, tag, message);
  }

  static void log(
    LogLevel level,
    String tag,
    Object? message, {
    StackTrace? stackTrace,
  }) {
    if (!buildConfig.logsEnabled) {
      return;
    }

    final now = DateTime.now();
    final isolateName = Isolate.current.debugName;

    final logItem = LogItem(
      level: level,
      date: now,
      tag: tag,
      message: '$message',
      isolateName: isolateName,
      stackTrace: stackTrace,
    );

    for (final logPrinter in _logPrinters) {
      logPrinter(logItem);
    }

    debugPrint('$logItem');
    _fileLogger.print(logItem);

    _logSubject.add(logItem);
  }

  static Future<List<String>> getLogs({String? filePath}) =>
      _fileLogger.getLogs(
        filePath: filePath,
      );

  static Future<File> getLogFile({String? filePath}) => _fileLogger.getLogFile(
        filePath: filePath,
      );

  static Future<List<File>> getLogFiles() => _fileLogger.getLogFiles();

  static Future<String> logsToString() => getLogs().then((it) => it.join('\n'));
}

class LogItem {
  LogItem({
    required this.level,
    required this.date,
    required this.tag,
    required this.message,
    required this.isolateName,
    this.stackTrace,
  });

  static const _dateFormatString = 'dd-MM-yyyy–HH:mm:ss:ms';
  static final _dateFormat = DateFormat(_dateFormatString);

  final LogLevel level;
  final DateTime date;
  final String tag;
  final String message;
  final String? isolateName;
  final StackTrace? stackTrace;

  @override
  String toString() {
    var result =
        '${describeEnum(level).toUpperCase()}/${_dateFormat.format(date)} [$isolateName] $tag: $message';
    if (stackTrace != null) {
      result += '\n$stackTrace';
    }
    return result;
  }
}
