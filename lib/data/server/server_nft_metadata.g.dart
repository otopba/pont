// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_nft_metadata.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ServerNftMetadata> _$serverNftMetadataSerializer =
    new _$ServerNftMetadataSerializer();

class _$ServerNftMetadataSerializer
    implements StructuredSerializer<ServerNftMetadata> {
  @override
  final Iterable<Type> types = const [ServerNftMetadata, _$ServerNftMetadata];
  @override
  final String wireName = 'ServerNftMetadata';

  @override
  Iterable<Object?> serialize(Serializers serializers, ServerNftMetadata object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.externalUrl;
    if (value != null) {
      result
        ..add('external_url')
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
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ServerNftMetadata deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ServerNftMetadataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'external_url':
          result.externalUrl = serializers.deserialize(value,
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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ServerNftMetadata extends ServerNftMetadata {
  @override
  final String? description;
  @override
  final String? externalUrl;
  @override
  final String? image;
  @override
  final String? marketplace;
  @override
  final String? name;

  factory _$ServerNftMetadata(
          [void Function(ServerNftMetadataBuilder)? updates]) =>
      (new ServerNftMetadataBuilder()..update(updates))._build();

  _$ServerNftMetadata._(
      {this.description,
      this.externalUrl,
      this.image,
      this.marketplace,
      this.name})
      : super._();

  @override
  ServerNftMetadata rebuild(void Function(ServerNftMetadataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServerNftMetadataBuilder toBuilder() =>
      new ServerNftMetadataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServerNftMetadata &&
        description == other.description &&
        externalUrl == other.externalUrl &&
        image == other.image &&
        marketplace == other.marketplace &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, description.hashCode), externalUrl.hashCode),
                image.hashCode),
            marketplace.hashCode),
        name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServerNftMetadata')
          ..add('description', description)
          ..add('externalUrl', externalUrl)
          ..add('image', image)
          ..add('marketplace', marketplace)
          ..add('name', name))
        .toString();
  }
}

class ServerNftMetadataBuilder
    implements Builder<ServerNftMetadata, ServerNftMetadataBuilder> {
  _$ServerNftMetadata? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _externalUrl;
  String? get externalUrl => _$this._externalUrl;
  set externalUrl(String? externalUrl) => _$this._externalUrl = externalUrl;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _marketplace;
  String? get marketplace => _$this._marketplace;
  set marketplace(String? marketplace) => _$this._marketplace = marketplace;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ServerNftMetadataBuilder();

  ServerNftMetadataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _externalUrl = $v.externalUrl;
      _image = $v.image;
      _marketplace = $v.marketplace;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServerNftMetadata other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServerNftMetadata;
  }

  @override
  void update(void Function(ServerNftMetadataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServerNftMetadata build() => _build();

  _$ServerNftMetadata _build() {
    final _$result = _$v ??
        new _$ServerNftMetadata._(
            description: description,
            externalUrl: externalUrl,
            image: image,
            marketplace: marketplace,
            name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
