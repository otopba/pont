// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pont_bottom_sheet_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PontBottomSheetState extends PontBottomSheetState {
  @override
  final ClientPont pont;

  factory _$PontBottomSheetState(
          [void Function(PontBottomSheetStateBuilder)? updates]) =>
      (new PontBottomSheetStateBuilder()..update(updates))._build();

  _$PontBottomSheetState._({required this.pont}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        pont, r'PontBottomSheetState', 'pont');
  }

  @override
  PontBottomSheetState rebuild(
          void Function(PontBottomSheetStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PontBottomSheetStateBuilder toBuilder() =>
      new PontBottomSheetStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PontBottomSheetState && pont == other.pont;
  }

  @override
  int get hashCode {
    return $jf($jc(0, pont.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PontBottomSheetState')
          ..add('pont', pont))
        .toString();
  }
}

class PontBottomSheetStateBuilder
    implements Builder<PontBottomSheetState, PontBottomSheetStateBuilder> {
  _$PontBottomSheetState? _$v;

  ClientPontBuilder? _pont;
  ClientPontBuilder get pont => _$this._pont ??= new ClientPontBuilder();
  set pont(ClientPontBuilder? pont) => _$this._pont = pont;

  PontBottomSheetStateBuilder();

  PontBottomSheetStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pont = $v.pont.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PontBottomSheetState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PontBottomSheetState;
  }

  @override
  void update(void Function(PontBottomSheetStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PontBottomSheetState build() => _build();

  _$PontBottomSheetState _build() {
    _$PontBottomSheetState _$result;
    try {
      _$result = _$v ?? new _$PontBottomSheetState._(pont: pont.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pont';
        pont.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PontBottomSheetState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
