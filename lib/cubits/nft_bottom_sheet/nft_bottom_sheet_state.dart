import 'package:built_value/built_value.dart';
import 'package:pont/data/client/client_nft.dart';

part 'nft_bottom_sheet_state.g.dart';

abstract class NftBottomSheetState
    implements Built<NftBottomSheetState, NftBottomSheetStateBuilder> {
  factory NftBottomSheetState(
          [void Function(NftBottomSheetStateBuilder) updates]) =
      _$NftBottomSheetState;

  NftBottomSheetState._();

  bool get loading;

  ClientNft get nft;

  String? get error;
}
