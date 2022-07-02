// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_page_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShopPageState extends ShopPageState {
  @override
  final BuiltList<ClientPont> ponts;

  factory _$ShopPageState([void Function(ShopPageStateBuilder)? updates]) =>
      (new ShopPageStateBuilder()..update(updates))._build();

  _$ShopPageState._({required this.ponts}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ponts, r'ShopPageState', 'ponts');
  }

  @override
  ShopPageState rebuild(void Function(ShopPageStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShopPageStateBuilder toBuilder() => new ShopPageStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShopPageState && ponts == other.ponts;
  }

  @override
  int get hashCode {
    return $jf($jc(0, ponts.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShopPageState')..add('ponts', ponts))
        .toString();
  }
}

class ShopPageStateBuilder
    implements Builder<ShopPageState, ShopPageStateBuilder> {
  _$ShopPageState? _$v;

  ListBuilder<ClientPont>? _ponts;
  ListBuilder<ClientPont> get ponts =>
      _$this._ponts ??= new ListBuilder<ClientPont>();
  set ponts(ListBuilder<ClientPont>? ponts) => _$this._ponts = ponts;

  ShopPageStateBuilder();

  ShopPageStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ponts = $v.ponts.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShopPageState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShopPageState;
  }

  @override
  void update(void Function(ShopPageStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShopPageState build() => _build();

  _$ShopPageState _build() {
    _$ShopPageState _$result;
    try {
      _$result = _$v ?? new _$ShopPageState._(ponts: ponts.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ponts';
        ponts.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ShopPageState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
