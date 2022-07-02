// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginPageState extends LoginPageState {
  @override
  final bool loading;
  @override
  final String? error;
  @override
  final bool openHomePage;

  factory _$LoginPageState([void Function(LoginPageStateBuilder)? updates]) =>
      (new LoginPageStateBuilder()..update(updates))._build();

  _$LoginPageState._(
      {required this.loading, this.error, required this.openHomePage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        loading, r'LoginPageState', 'loading');
    BuiltValueNullFieldError.checkNotNull(
        openHomePage, r'LoginPageState', 'openHomePage');
  }

  @override
  LoginPageState rebuild(void Function(LoginPageStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginPageStateBuilder toBuilder() =>
      new LoginPageStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginPageState &&
        loading == other.loading &&
        error == other.error &&
        openHomePage == other.openHomePage;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, loading.hashCode), error.hashCode), openHomePage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginPageState')
          ..add('loading', loading)
          ..add('error', error)
          ..add('openHomePage', openHomePage))
        .toString();
  }
}

class LoginPageStateBuilder
    implements Builder<LoginPageState, LoginPageStateBuilder> {
  _$LoginPageState? _$v;

  bool? _loading;
  bool? get loading => _$this._loading;
  set loading(bool? loading) => _$this._loading = loading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _openHomePage;
  bool? get openHomePage => _$this._openHomePage;
  set openHomePage(bool? openHomePage) => _$this._openHomePage = openHomePage;

  LoginPageStateBuilder();

  LoginPageStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _loading = $v.loading;
      _error = $v.error;
      _openHomePage = $v.openHomePage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginPageState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginPageState;
  }

  @override
  void update(void Function(LoginPageStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginPageState build() => _build();

  _$LoginPageState _build() {
    final _$result = _$v ??
        new _$LoginPageState._(
            loading: BuiltValueNullFieldError.checkNotNull(
                loading, r'LoginPageState', 'loading'),
            error: error,
            openHomePage: BuiltValueNullFieldError.checkNotNull(
                openHomePage, r'LoginPageState', 'openHomePage'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
