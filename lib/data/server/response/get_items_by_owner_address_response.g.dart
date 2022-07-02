// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_items_by_owner_address_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetItemsByOwnerAddressResponse>
    _$getItemsByOwnerAddressResponseSerializer =
    new _$GetItemsByOwnerAddressResponseSerializer();

class _$GetItemsByOwnerAddressResponseSerializer
    implements StructuredSerializer<GetItemsByOwnerAddressResponse> {
  @override
  final Iterable<Type> types = const [
    GetItemsByOwnerAddressResponse,
    _$GetItemsByOwnerAddressResponse
  ];
  @override
  final String wireName = 'GetItemsByOwnerAddressResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GetItemsByOwnerAddressResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'nft_items',
      serializers.serialize(object.nftItems,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ServerNft)])),
    ];

    return result;
  }

  @override
  GetItemsByOwnerAddressResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetItemsByOwnerAddressResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'nft_items':
          result.nftItems.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ServerNft)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GetItemsByOwnerAddressResponse extends GetItemsByOwnerAddressResponse {
  @override
  final BuiltList<ServerNft> nftItems;

  factory _$GetItemsByOwnerAddressResponse(
          [void Function(GetItemsByOwnerAddressResponseBuilder)? updates]) =>
      (new GetItemsByOwnerAddressResponseBuilder()..update(updates))._build();

  _$GetItemsByOwnerAddressResponse._({required this.nftItems}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        nftItems, r'GetItemsByOwnerAddressResponse', 'nftItems');
  }

  @override
  GetItemsByOwnerAddressResponse rebuild(
          void Function(GetItemsByOwnerAddressResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetItemsByOwnerAddressResponseBuilder toBuilder() =>
      new GetItemsByOwnerAddressResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetItemsByOwnerAddressResponse &&
        nftItems == other.nftItems;
  }

  @override
  int get hashCode {
    return $jf($jc(0, nftItems.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetItemsByOwnerAddressResponse')
          ..add('nftItems', nftItems))
        .toString();
  }
}

class GetItemsByOwnerAddressResponseBuilder
    implements
        Builder<GetItemsByOwnerAddressResponse,
            GetItemsByOwnerAddressResponseBuilder> {
  _$GetItemsByOwnerAddressResponse? _$v;

  ListBuilder<ServerNft>? _nftItems;
  ListBuilder<ServerNft> get nftItems =>
      _$this._nftItems ??= new ListBuilder<ServerNft>();
  set nftItems(ListBuilder<ServerNft>? nftItems) => _$this._nftItems = nftItems;

  GetItemsByOwnerAddressResponseBuilder();

  GetItemsByOwnerAddressResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nftItems = $v.nftItems.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetItemsByOwnerAddressResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetItemsByOwnerAddressResponse;
  }

  @override
  void update(void Function(GetItemsByOwnerAddressResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetItemsByOwnerAddressResponse build() => _build();

  _$GetItemsByOwnerAddressResponse _build() {
    _$GetItemsByOwnerAddressResponse _$result;
    try {
      _$result = _$v ??
          new _$GetItemsByOwnerAddressResponse._(nftItems: nftItems.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'nftItems';
        nftItems.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetItemsByOwnerAddressResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
