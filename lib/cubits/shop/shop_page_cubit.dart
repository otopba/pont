import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pont/cubits/shop/shop_page_state.dart';
import 'package:pont/data/client/client_pont.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:built_collection/built_collection.dart';

const _tag = 'shop_page_cubit';

class ShopPageCubit extends Cubit<ShopPageState> {
  ShopPageCubit()
      : super(
          ShopPageState(
            (b) => b
              ..ponts = ListBuilder<ClientPont>(
                [
                  ClientPont(
                    (b) => b
                      ..type = ClientPontType.casual
                      ..name = "Pont Casual"
                      ..description = "Titanium Edition"
                      ..history =
                          "The publication has devoured the best developments. Cast “Pont” in 99 gold is perfect for your NFT collection"
                      ..price = 99,
                  ),
                  ClientPont(
                    (b) => b
                      ..type = ClientPontType.classic
                      ..name = "Pont Classic"
                      ..description = "Silver Edition"
                      ..history =
                          "The publication has devoured the best developments. Cast “Pont” in 99 gold is perfect for your NFT collection"
                      ..price = 699,
                  ),
                  ClientPont(
                    (b) => b
                      ..type = ClientPontType.hype
                      ..name = "Pont Hype"
                      ..description = "Gold Edition"
                      ..history =
                          "The publication has devoured the best developments. Cast “Pont” in 99 gold is perfect for your NFT collection"
                      ..price = 99,
                  ),
                  ClientPont(
                    (b) => b
                      ..type = ClientPontType.platinum
                      ..name = "Pont Platinum"
                      ..description = "Critical Edition"
                      ..history =
                          "The publication has devoured the best developments. Cast “Pont” in 99 gold is perfect for your NFT collection"
                      ..price = 2999,
                  ),
                ],
              ),
          ),
        ) {
    _init();
  }

  Future<void> _init() async {
    Log.d(_tag, '_init');
  }
}
