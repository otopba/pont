import 'dart:io';

import 'package:pont/utils/logs/log.dart';

abstract class FileLogger {
  void print(LogItem item);

  Future<List<String>> getLogs({String? filePath});

  Future<File> getLogFile({String? filePath});

  Future<List<File>> getLogFiles();
}
