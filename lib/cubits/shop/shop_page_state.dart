import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:pont/data/client/client_pont.dart';

part 'shop_page_state.g.dart';

abstract class ShopPageState
    implements Built<ShopPageState, ShopPageStateBuilder> {
  factory ShopPageState([void Function(ShopPageStateBuilder) updates]) =
      _$ShopPageState;

  ShopPageState._();

  BuiltList<ClientPont> get ponts;
}
