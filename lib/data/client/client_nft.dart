import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'client_nft.g.dart';

abstract class ClientNft implements Built<ClientNft, ClientNftBuilder> {
  factory ClientNft([void Function(ClientNftBuilder) updates]) = _$ClientNft;

  ClientNft._();

  static Serializer<ClientNft> get serializer => _$clientNftSerializer;

  String get address;

  String? get name;

  String? get description;

  String? get image;

  String? get marketplace;
}
