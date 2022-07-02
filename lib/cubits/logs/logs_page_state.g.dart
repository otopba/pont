// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logs_page_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LogsPageState extends LogsPageState {
  @override
  final bool loading;
  @override
  final BuiltList<String> logs;
  @override
  final BuiltList<String> logFiles;
  @override
  final String? selectedFile;

  factory _$LogsPageState([void Function(LogsPageStateBuilder)? updates]) =>
      (new LogsPageStateBuilder()..update(updates))._build();

  _$LogsPageState._(
      {required this.loading,
      required this.logs,
      required this.logFiles,
      this.selectedFile})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(loading, r'LogsPageState', 'loading');
    BuiltValueNullFieldError.checkNotNull(logs, r'LogsPageState', 'logs');
    BuiltValueNullFieldError.checkNotNull(
        logFiles, r'LogsPageState', 'logFiles');
  }

  @override
  LogsPageState rebuild(void Function(LogsPageStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogsPageStateBuilder toBuilder() => new LogsPageStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogsPageState &&
        loading == other.loading &&
        logs == other.logs &&
        logFiles == other.logFiles &&
        selectedFile == other.selectedFile;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, loading.hashCode), logs.hashCode), logFiles.hashCode),
        selectedFile.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LogsPageState')
          ..add('loading', loading)
          ..add('logs', logs)
          ..add('logFiles', logFiles)
          ..add('selectedFile', selectedFile))
        .toString();
  }
}

class LogsPageStateBuilder
    implements Builder<LogsPageState, LogsPageStateBuilder> {
  _$LogsPageState? _$v;

  bool? _loading;
  bool? get loading => _$this._loading;
  set loading(bool? loading) => _$this._loading = loading;

  ListBuilder<String>? _logs;
  ListBuilder<String> get logs => _$this._logs ??= new ListBuilder<String>();
  set logs(ListBuilder<String>? logs) => _$this._logs = logs;

  ListBuilder<String>? _logFiles;
  ListBuilder<String> get logFiles =>
      _$this._logFiles ??= new ListBuilder<String>();
  set logFiles(ListBuilder<String>? logFiles) => _$this._logFiles = logFiles;

  String? _selectedFile;
  String? get selectedFile => _$this._selectedFile;
  set selectedFile(String? selectedFile) => _$this._selectedFile = selectedFile;

  LogsPageStateBuilder();

  LogsPageStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _loading = $v.loading;
      _logs = $v.logs.toBuilder();
      _logFiles = $v.logFiles.toBuilder();
      _selectedFile = $v.selectedFile;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LogsPageState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogsPageState;
  }

  @override
  void update(void Function(LogsPageStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LogsPageState build() => _build();

  _$LogsPageState _build() {
    _$LogsPageState _$result;
    try {
      _$result = _$v ??
          new _$LogsPageState._(
              loading: BuiltValueNullFieldError.checkNotNull(
                  loading, r'LogsPageState', 'loading'),
              logs: logs.build(),
              logFiles: logFiles.build(),
              selectedFile: selectedFile);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'logs';
        logs.build();
        _$failedField = 'logFiles';
        logFiles.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LogsPageState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
