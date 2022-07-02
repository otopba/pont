import 'dart:async';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pont/utils/logs/file_logger.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:pont/utils/string_extension.dart';

class RealFileLogger extends FileLogger {
  RealFileLogger() {
    getLogFile()
        .then((it) => it.openWrite(mode: FileMode.writeOnlyAppend))
        .then(_sink.complete);
  }

  static const _dateFormatString = 'dd-MM-yyyy';
  static final _dateFormat = DateFormat(_dateFormatString);
  final _sink = Completer<IOSink>();

  @override
  void print(LogItem item) {
    _sink.future.then((sink) {
      sink.write(item);
      sink.writeln();
    });
  }

  @override
  Future<List<String>> getLogs({String? filePath}) async {
    final file = await getLogFile(filePath: filePath);
    if (file.existsSync()) {
      return file.readAsLinesSync();
    } else {
      return List.empty();
    }
  }

  @override
  Future<File> getLogFile({String? filePath}) async {
    if (filePath.isNullOrEmpty) {
      return getTemporaryDirectory().then(
        (it) => File('${it.path}/${_dateFormat.format(DateTime.now())}.log'),
      );
    } else {
      return File(filePath!);
    }
  }

  @override
  Future<List<File>> getLogFiles() async {
    final dir = await getTemporaryDirectory();
    return dir
        .listSync()
        .map((it) => File(it.path))
        .where((it) => it.path.endsWith('.log'))
        .toList();
  }
}
