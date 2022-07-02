// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_nft.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ClientNft> _$clientNftSerializer = new _$ClientNftSerializer();

class _$ClientNftSerializer implements StructuredSerializer<ClientNft> {
  @override
  final Iterable<Type> types = const [ClientNft, _$ClientNft];
  @override
  final String wireName = 'ClientNft';

  @override
  Iterable<Object?> serialize(Serializers serializers, ClientNft object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.marketplace;
    if (value != null) {
      result
        ..add('marketplace')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ClientNft deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClientNftBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'marketplace':
          result.marketplace = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ClientNft extends ClientNft {
  @override
  final String address;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? image;
  @override
  final String? marketplace;

  factory _$ClientNft([void Function(ClientNftBuilder)? updates]) =>
      (new ClientNftBuilder()..update(updates))._build();

  _$ClientNft._(
      {required this.address,
      this.name,
      this.description,
      this.image,
      this.marketplace})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(address, r'ClientNft', 'address');
  }

  @override
  ClientNft rebuild(void Function(ClientNftBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClientNftBuilder toBuilder() => new ClientNftBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClientNft &&
        address == other.address &&
        name == other.name &&
        description == other.description &&
        image == other.image &&
        marketplace == other.marketplace;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, address.hashCode), name.hashCode),
                description.hashCode),
            image.hashCode),
        marketplace.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClientNft')
          ..add('address', address)
          ..add('name', name)
          ..add('description', description)
          ..add('image', image)
          ..add('marketplace', marketplace))
        .toString();
  }
}

class ClientNftBuilder implements Builder<ClientNft, ClientNftBuilder> {
  _$ClientNft? _$v;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _marketplace;
  String? get marketplace => _$this._marketplace;
  set marketplace(String? marketplace) => _$this._marketplace = marketplace;

  ClientNftBuilder();

  ClientNftBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address;
      _name = $v.name;
      _description = $v.description;
      _image = $v.image;
      _marketplace = $v.marketplace;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClientNft other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClientNft;
  }

  @override
  void update(void Function(ClientNftBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClientNft build() => _build();

  _$ClientNft _build() {
    final _$result = _$v ??
        new _$ClientNft._(
            address: BuiltValueNullFieldError.checkNotNull(
                address, r'ClientNft', 'address'),
            name: name,
            description: description,
            image: image,
            marketplace: marketplace);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
