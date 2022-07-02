// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_pont.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClientPont extends ClientPont {
  @override
  final ClientPontType type;
  @override
  final String name;
  @override
  final String description;
  @override
  final String history;
  @override
  final int? price;

  factory _$ClientPont([void Function(ClientPontBuilder)? updates]) =>
      (new ClientPontBuilder()..update(updates))._build();

  _$ClientPont._(
      {required this.type,
      required this.name,
      required this.description,
      required this.history,
      this.price})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'ClientPont', 'type');
    BuiltValueNullFieldError.checkNotNull(name, r'ClientPont', 'name');
    BuiltValueNullFieldError.checkNotNull(
        description, r'ClientPont', 'description');
    BuiltValueNullFieldError.checkNotNull(history, r'ClientPont', 'history');
  }

  @override
  ClientPont rebuild(void Function(ClientPontBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClientPontBuilder toBuilder() => new ClientPontBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClientPont &&
        type == other.type &&
        name == other.name &&
        description == other.description &&
        history == other.history &&
        price == other.price;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, type.hashCode), name.hashCode),
                description.hashCode),
            history.hashCode),
        price.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClientPont')
          ..add('type', type)
          ..add('name', name)
          ..add('description', description)
          ..add('history', history)
          ..add('price', price))
        .toString();
  }
}

class ClientPontBuilder implements Builder<ClientPont, ClientPontBuilder> {
  _$ClientPont? _$v;

  ClientPontType? _type;
  ClientPontType? get type => _$this._type;
  set type(ClientPontType? type) => _$this._type = type;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _history;
  String? get history => _$this._history;
  set history(String? history) => _$this._history = history;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  ClientPontBuilder();

  ClientPontBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _name = $v.name;
      _description = $v.description;
      _history = $v.history;
      _price = $v.price;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClientPont other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClientPont;
  }

  @override
  void update(void Function(ClientPontBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClientPont build() => _build();

  _$ClientPont _build() {
    final _$result = _$v ??
        new _$ClientPont._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'ClientPont', 'type'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ClientPont', 'name'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'ClientPont', 'description'),
            history: BuiltValueNullFieldError.checkNotNull(
                history, r'ClientPont', 'history'),
            price: price);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
