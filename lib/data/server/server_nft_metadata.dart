import 'package:built_value/serializer.dart';
import 'package:built_value/built_value.dart';

part 'server_nft_metadata.g.dart';

abstract class ServerNftMetadata
    implements Built<ServerNftMetadata, ServerNftMetadataBuilder> {
  factory ServerNftMetadata([void Function(ServerNftMetadataBuilder) updates]) =
      _$ServerNftMetadata;

  ServerNftMetadata._();

  static Serializer<ServerNftMetadata> get serializer =>
      _$serverNftMetadataSerializer;

  String? get description;

  @BuiltValueField(wireName: 'external_url')
  String? get externalUrl;

  String? get image;

  String? get marketplace;

  String? get name;
}
