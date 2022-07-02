import 'package:built_value/serializer.dart';
import 'package:built_value/built_value.dart';

part 'server_nft_owner.g.dart';

abstract class ServerNftOwner
    implements Built<ServerNftOwner, ServerNftOwnerBuilder> {
  factory ServerNftOwner([void Function(ServerNftOwnerBuilder) updates]) =
      _$ServerNftOwner;

  ServerNftOwner._();

  static Serializer<ServerNftOwner> get serializer =>
      _$serverNftOwnerSerializer;

  String get address;
}
