import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

part 'logs_page_state.g.dart';

abstract class LogsPageState
    implements Built<LogsPageState, LogsPageStateBuilder> {
  factory LogsPageState(
          [void Function(LogsPageStateBuilder) updates]) =
      _$LogsPageState;

  LogsPageState._();

  bool get loading;

  BuiltList<String> get logs;

  BuiltList<String> get logFiles;

  String? get selectedFile;
}
