import 'dart:io';

import 'package:pont/utils/logs/file_logger.dart';
import 'package:pont/utils/logs/log.dart';

class MockFileLogger extends FileLogger {
  @override
  void print(LogItem item) {}

  @override
  Future<List<String>> getLogs({String? filePath}) =>
      Future.value(List<String>.empty());

  @override
  Future<File> getLogFile({String? filePath}) => Future.value(File(''));

  @override
  Future<List<File>> getLogFiles() => Future.value(List<File>.empty());
}
