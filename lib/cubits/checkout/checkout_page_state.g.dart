// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_page_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CheckoutPageState extends CheckoutPageState {
  @override
  final bool validInput;

  factory _$CheckoutPageState(
          [void Function(CheckoutPageStateBuilder)? updates]) =>
      (new CheckoutPageStateBuilder()..update(updates))._build();

  _$CheckoutPageState._({required this.validInput}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        validInput, r'CheckoutPageState', 'validInput');
  }

  @override
  CheckoutPageState rebuild(void Function(CheckoutPageStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckoutPageStateBuilder toBuilder() =>
      new CheckoutPageStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckoutPageState && validInput == other.validInput;
  }

  @override
  int get hashCode {
    return $jf($jc(0, validInput.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CheckoutPageState')
          ..add('validInput', validInput))
        .toString();
  }
}

class CheckoutPageStateBuilder
    implements Builder<CheckoutPageState, CheckoutPageStateBuilder> {
  _$CheckoutPageState? _$v;

  bool? _validInput;
  bool? get validInput => _$this._validInput;
  set validInput(bool? validInput) => _$this._validInput = validInput;

  CheckoutPageStateBuilder();

  CheckoutPageStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _validInput = $v.validInput;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CheckoutPageState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CheckoutPageState;
  }

  @override
  void update(void Function(CheckoutPageStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckoutPageState build() => _build();

  _$CheckoutPageState _build() {
    final _$result = _$v ??
        new _$CheckoutPageState._(
            validInput: BuiltValueNullFieldError.checkNotNull(
                validInput, r'CheckoutPageState', 'validInput'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
