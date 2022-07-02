import 'package:built_value/built_value.dart';
import 'package:pont/data/client/client_nft.dart';
import 'package:built_collection/built_collection.dart';

part 'nft_list_page_state.g.dart';

abstract class NftListPageState
    implements Built<NftListPageState, NftListPageStateBuilder> {
  factory NftListPageState([void Function(NftListPageStateBuilder) updates]) =
      _$NftListPageState;

  NftListPageState._();

  bool get loading;

  BuiltList<ClientNft> get nftList;

  String? get activeNftAddress;
}
