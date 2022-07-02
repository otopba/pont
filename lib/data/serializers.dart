// @dart=2.12

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:pont/data/client/client_nft.dart';
import 'package:pont/data/server/response/get_items_by_owner_address_response.dart';
import 'package:pont/data/server/server_nft.dart';
import 'package:pont/data/server/server_nft_metadata.dart';
import 'package:pont/data/server/server_nft_owner.dart';
import 'package:pont/data/server/server_session.dart';

part 'serializers.g.dart';

@SerializersFor([
  ServerNft,
  ClientNft,
  GetItemsByOwnerAddressResponse,
  ServerNftMetadata,
  ServerNftOwner,
  ServerSession,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

T? deserialize<T>(dynamic value) => serializers.deserializeWith<T>(
      serializers.serializerForType(T)! as Serializer<T>,
      value,
    );

BuiltList<T?> deserializeListOf<T>(Iterable value) => BuiltList.from(
      value
          .map((dynamic value) => deserialize<T>(value))
          .toList(growable: false),
    );

Map<String, dynamic>? serialize<T>(T? value) => serializers.serializeWith(
      serializers.serializerForType(T)! as Serializer<T>,
      value,
    ) as Map<String, dynamic>?;
