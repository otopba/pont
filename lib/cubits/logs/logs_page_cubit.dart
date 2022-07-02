import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:pont/cubits/logs/logs_page_state.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:share_plus/share_plus.dart';

const _tag = 'logs_page_cubit';

class LogsPageCubit extends Cubit<LogsPageState> {
  List<File> _logFiles = <File>[];

  LogsPageCubit()
      : super(
          LogsPageState(
            (b) => b
              ..loading = true
              ..logs = ListBuilder<String>()
              ..logFiles = ListBuilder<String>(),
          ),
        ) {
    _init();
  }

  Future<void> _init() async {
    Log.d(_tag, '_init');

    _logFiles = await Log.getLogFiles();

    final logFiles = _logFiles.map((it) => it.path);

    emit(state.rebuild(
      (b) => b..logFiles = logFiles.toBuiltList().toBuilder(),
    ));

    selectFile(logFiles.last);
  }

  Future<void> shareLogs() async {
    final file = await Log.getLogFile(filePath: state.selectedFile);
    Share.shareFiles([file.path]);
  }

  Future<void> selectFile(String? file) async {
    Log.d(_tag, 'selectFile: file = $file');

    emit(state.rebuild((b) => b..loading = true));

    final logs = await Log.getLogs(filePath: file).then(
      (it) => it.reversed.toList(),
    );

    emit(state.rebuild(
      (b) => b
        ..loading = false
        ..selectedFile = file
        ..logs = logs.toBuiltList().toBuilder(),
    ));
  }
}
