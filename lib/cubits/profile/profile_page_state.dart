import 'package:built_value/built_value.dart';
import 'package:pont/data/client/client_nft.dart';
import 'package:built_collection/built_collection.dart';

part 'profile_page_state.g.dart';

abstract class ProfilePageState
    implements Built<ProfilePageState, ProfilePageStateBuilder> {
  factory ProfilePageState([void Function(ProfilePageStateBuilder) updates]) =
      _$ProfilePageState;

  ProfilePageState._();

  bool get loading;

  String get address;
}
