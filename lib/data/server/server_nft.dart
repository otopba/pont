import 'package:built_value/serializer.dart';
import 'package:built_value/built_value.dart';
import 'package:pont/data/server/server_nft_metadata.dart';
import 'package:pont/data/server/server_nft_owner.dart';

part 'server_nft.g.dart';

abstract class ServerNft implements Built<ServerNft, ServerNftBuilder> {
  factory ServerNft([void Function(ServerNftBuilder) updates]) = _$ServerNft;

  ServerNft._();

  static Serializer<ServerNft> get serializer => _$serverNftSerializer;

  String get address;

  int get index;

  bool get init;

  ServerNftMetadata get metadata;

  ServerNftOwner get owner;

  @BuiltValueField(wireName: 'raw_individual_content')
  String get rawIndividualContent;

  bool get verified;
}
