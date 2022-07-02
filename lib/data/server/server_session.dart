import 'package:built_value/serializer.dart';
import 'package:built_value/built_value.dart';

part 'server_session.g.dart';

abstract class ServerSession
    implements Built<ServerSession, ServerSessionBuilder> {
  factory ServerSession([void Function(ServerSessionBuilder) updates]) =
      _$ServerSession;

  ServerSession._();

  static Serializer<ServerSession> get serializer => _$serverSessionSerializer;

  String? get address;
}
