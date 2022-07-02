import 'package:built_value/serializer.dart';
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:pont/data/server/server_nft.dart';

part 'get_items_by_owner_address_response.g.dart';

abstract class GetItemsByOwnerAddressResponse
    implements
        Built<GetItemsByOwnerAddressResponse,
            GetItemsByOwnerAddressResponseBuilder> {
  factory GetItemsByOwnerAddressResponse(
          [void Function(GetItemsByOwnerAddressResponseBuilder) updates]) =
      _$GetItemsByOwnerAddressResponse;

  GetItemsByOwnerAddressResponse._();

  static Serializer<GetItemsByOwnerAddressResponse> get serializer =>
      _$getItemsByOwnerAddressResponseSerializer;

  @BuiltValueField(wireName: 'nft_items')
  BuiltList<ServerNft> get nftItems;
}
