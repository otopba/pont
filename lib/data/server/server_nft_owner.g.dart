// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_nft_owner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ServerNftOwner> _$serverNftOwnerSerializer =
    new _$ServerNftOwnerSerializer();

class _$ServerNftOwnerSerializer
    implements StructuredSerializer<ServerNftOwner> {
  @override
  final Iterable<Type> types = const [ServerNftOwner, _$ServerNftOwner];
  @override
  final String wireName = 'ServerNftOwner';

  @override
  Iterable<Object?> serialize(Serializers serializers, ServerNftOwner object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ServerNftOwner deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ServerNftOwnerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ServerNftOwner extends ServerNftOwner {
  @override
  final String address;

  factory _$ServerNftOwner([void Function(ServerNftOwnerBuilder)? updates]) =>
      (new ServerNftOwnerBuilder()..update(updates))._build();

  _$ServerNftOwner._({required this.address}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        address, r'ServerNftOwner', 'address');
  }

  @override
  ServerNftOwner rebuild(void Function(ServerNftOwnerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServerNftOwnerBuilder toBuilder() =>
      new ServerNftOwnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServerNftOwner && address == other.address;
  }

  @override
  int get hashCode {
    return $jf($jc(0, address.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServerNftOwner')
          ..add('address', address))
        .toString();
  }
}

class ServerNftOwnerBuilder
    implements Builder<ServerNftOwner, ServerNftOwnerBuilder> {
  _$ServerNftOwner? _$v;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  ServerNftOwnerBuilder();

  ServerNftOwnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServerNftOwner other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServerNftOwner;
  }

  @override
  void update(void Function(ServerNftOwnerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServerNftOwner build() => _build();

  _$ServerNftOwner _build() {
    final _$result = _$v ??
        new _$ServerNftOwner._(
            address: BuiltValueNullFieldError.checkNotNull(
                address, r'ServerNftOwner', 'address'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
