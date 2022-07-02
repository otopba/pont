// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_session.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ServerSession> _$serverSessionSerializer =
    new _$ServerSessionSerializer();

class _$ServerSessionSerializer implements StructuredSerializer<ServerSession> {
  @override
  final Iterable<Type> types = const [ServerSession, _$ServerSession];
  @override
  final String wireName = 'ServerSession';

  @override
  Iterable<Object?> serialize(Serializers serializers, ServerSession object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ServerSession deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ServerSessionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ServerSession extends ServerSession {
  @override
  final String? address;

  factory _$ServerSession([void Function(ServerSessionBuilder)? updates]) =>
      (new ServerSessionBuilder()..update(updates))._build();

  _$ServerSession._({this.address}) : super._();

  @override
  ServerSession rebuild(void Function(ServerSessionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServerSessionBuilder toBuilder() => new ServerSessionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServerSession && address == other.address;
  }

  @override
  int get hashCode {
    return $jf($jc(0, address.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServerSession')
          ..add('address', address))
        .toString();
  }
}

class ServerSessionBuilder
    implements Builder<ServerSession, ServerSessionBuilder> {
  _$ServerSession? _$v;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  ServerSessionBuilder();

  ServerSessionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServerSession other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServerSession;
  }

  @override
  void update(void Function(ServerSessionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServerSession build() => _build();

  _$ServerSession _build() {
    final _$result = _$v ?? new _$ServerSession._(address: address);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
