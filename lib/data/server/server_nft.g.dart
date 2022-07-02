// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_nft.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ServerNft> _$serverNftSerializer = new _$ServerNftSerializer();

class _$ServerNftSerializer implements StructuredSerializer<ServerNft> {
  @override
  final Iterable<Type> types = const [ServerNft, _$ServerNft];
  @override
  final String wireName = 'ServerNft';

  @override
  Iterable<Object?> serialize(Serializers serializers, ServerNft object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'index',
      serializers.serialize(object.index, specifiedType: const FullType(int)),
      'init',
      serializers.serialize(object.init, specifiedType: const FullType(bool)),
      'metadata',
      serializers.serialize(object.metadata,
          specifiedType: const FullType(ServerNftMetadata)),
      'owner',
      serializers.serialize(object.owner,
          specifiedType: const FullType(ServerNftOwner)),
      'raw_individual_content',
      serializers.serialize(object.rawIndividualContent,
          specifiedType: const FullType(String)),
      'verified',
      serializers.serialize(object.verified,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  ServerNft deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ServerNftBuilder();

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
        case 'index':
          result.index = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'init':
          result.init = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'metadata':
          result.metadata.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ServerNftMetadata))!
              as ServerNftMetadata);
          break;
        case 'owner':
          result.owner.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ServerNftOwner))!
              as ServerNftOwner);
          break;
        case 'raw_individual_content':
          result.rawIndividualContent = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'verified':
          result.verified = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$ServerNft extends ServerNft {
  @override
  final String address;
  @override
  final int index;
  @override
  final bool init;
  @override
  final ServerNftMetadata metadata;
  @override
  final ServerNftOwner owner;
  @override
  final String rawIndividualContent;
  @override
  final bool verified;

  factory _$ServerNft([void Function(ServerNftBuilder)? updates]) =>
      (new ServerNftBuilder()..update(updates))._build();

  _$ServerNft._(
      {required this.address,
      required this.index,
      required this.init,
      required this.metadata,
      required this.owner,
      required this.rawIndividualContent,
      required this.verified})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(address, r'ServerNft', 'address');
    BuiltValueNullFieldError.checkNotNull(index, r'ServerNft', 'index');
    BuiltValueNullFieldError.checkNotNull(init, r'ServerNft', 'init');
    BuiltValueNullFieldError.checkNotNull(metadata, r'ServerNft', 'metadata');
    BuiltValueNullFieldError.checkNotNull(owner, r'ServerNft', 'owner');
    BuiltValueNullFieldError.checkNotNull(
        rawIndividualContent, r'ServerNft', 'rawIndividualContent');
    BuiltValueNullFieldError.checkNotNull(verified, r'ServerNft', 'verified');
  }

  @override
  ServerNft rebuild(void Function(ServerNftBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServerNftBuilder toBuilder() => new ServerNftBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServerNft &&
        address == other.address &&
        index == other.index &&
        init == other.init &&
        metadata == other.metadata &&
        owner == other.owner &&
        rawIndividualContent == other.rawIndividualContent &&
        verified == other.verified;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, address.hashCode), index.hashCode),
                        init.hashCode),
                    metadata.hashCode),
                owner.hashCode),
            rawIndividualContent.hashCode),
        verified.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServerNft')
          ..add('address', address)
          ..add('index', index)
          ..add('init', init)
          ..add('metadata', metadata)
          ..add('owner', owner)
          ..add('rawIndividualContent', rawIndividualContent)
          ..add('verified', verified))
        .toString();
  }
}

class ServerNftBuilder implements Builder<ServerNft, ServerNftBuilder> {
  _$ServerNft? _$v;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  bool? _init;
  bool? get init => _$this._init;
  set init(bool? init) => _$this._init = init;

  ServerNftMetadataBuilder? _metadata;
  ServerNftMetadataBuilder get metadata =>
      _$this._metadata ??= new ServerNftMetadataBuilder();
  set metadata(ServerNftMetadataBuilder? metadata) =>
      _$this._metadata = metadata;

  ServerNftOwnerBuilder? _owner;
  ServerNftOwnerBuilder get owner =>
      _$this._owner ??= new ServerNftOwnerBuilder();
  set owner(ServerNftOwnerBuilder? owner) => _$this._owner = owner;

  String? _rawIndividualContent;
  String? get rawIndividualContent => _$this._rawIndividualContent;
  set rawIndividualContent(String? rawIndividualContent) =>
      _$this._rawIndividualContent = rawIndividualContent;

  bool? _verified;
  bool? get verified => _$this._verified;
  set verified(bool? verified) => _$this._verified = verified;

  ServerNftBuilder();

  ServerNftBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address;
      _index = $v.index;
      _init = $v.init;
      _metadata = $v.metadata.toBuilder();
      _owner = $v.owner.toBuilder();
      _rawIndividualContent = $v.rawIndividualContent;
      _verified = $v.verified;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServerNft other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServerNft;
  }

  @override
  void update(void Function(ServerNftBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServerNft build() => _build();

  _$ServerNft _build() {
    _$ServerNft _$result;
    try {
      _$result = _$v ??
          new _$ServerNft._(
              address: BuiltValueNullFieldError.checkNotNull(
                  address, r'ServerNft', 'address'),
              index: BuiltValueNullFieldError.checkNotNull(
                  index, r'ServerNft', 'index'),
              init: BuiltValueNullFieldError.checkNotNull(
                  init, r'ServerNft', 'init'),
              metadata: metadata.build(),
              owner: owner.build(),
              rawIndividualContent: BuiltValueNullFieldError.checkNotNull(
                  rawIndividualContent, r'ServerNft', 'rawIndividualContent'),
              verified: BuiltValueNullFieldError.checkNotNull(
                  verified, r'ServerNft', 'verified'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'metadata';
        metadata.build();
        _$failedField = 'owner';
        owner.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServerNft', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
