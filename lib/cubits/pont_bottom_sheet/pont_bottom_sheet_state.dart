import 'package:built_value/built_value.dart';
import 'package:pont/data/client/client_nft.dart';
import 'package:pont/data/client/client_pont.dart';

part 'pont_bottom_sheet_state.g.dart';

abstract class PontBottomSheetState
    implements Built<PontBottomSheetState, PontBottomSheetStateBuilder> {
  factory PontBottomSheetState(
          [void Function(PontBottomSheetStateBuilder) updates]) =
      _$PontBottomSheetState;

  PontBottomSheetState._();

  ClientPont get pont;
}
