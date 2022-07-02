import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pont/bottom_sheets/pont_bottom_sheet.dart';
import 'package:pont/cubits/shop/shop_page_cubit.dart';
import 'package:pont/cubits/shop/shop_page_state.dart';
import 'package:pont/data/client/client_pont.dart';
import 'package:pont/pont_bottom_sheet.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:pont/widgets/app_menu.dart';

const _tag = 'shop_page';

class ShopPage extends StatefulWidget {
  static const routeName = 'shop';

  const ShopPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final _numberFormat = NumberFormat('#,###');
  final _cubit = ShopPageCubit();
  late ShopPageState _state;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopPageCubit, ShopPageState>(
      bloc: _cubit,
      listener: (context, state) {},
      builder: (context, state) {
        _state = state;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: _body(),
          ),
        );
      },
    );
  }

  Widget _body() {
    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: <Widget>[
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            _top(),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            _list(),
          ],
        ),
        _menu(),
      ],
    );
  }

  Widget _menu() {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: AppMenu(activeType: AppMenuType.shop),
      ),
    );
  }

  Widget _top() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _title(),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return const Text(
      "Store",
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.37,
        height: 1.17,
      ),
    );
  }

  Widget _list() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          _itemDelegate,
          childCount: _state.ponts.length,
        ),
      ),
    );
  }

  Widget _itemDelegate(BuildContext context, int index) {
    final pont = _state.ponts[index];

    return GestureDetector(
      onTap: () => _onPontPressed(pont),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 35),
        child: Row(
          children: [
            pont.type.getImage(width: 130, height: 130),
            const SizedBox(width: 24),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _pontTitle(pont),
                  const SizedBox(height: 2),
                  _pontDescription(pont),
                  const SizedBox(height: 17),
                  _buyButton(pont),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buyButton(ClientPont pont) {
    return ElevatedButton(
      onPressed: () => _onBuyPressed(pont),
      child: Text(
        "${_numberFormat.format(pont.price).replaceAll(',', ' ')} TON",
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.45,
          height: 1.27,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        elevation: MaterialStateProperty.all<double>(0),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
        ),
      ),
    );
  }

  Widget _pontDescription(ClientPont pont) {
    return Text(
      pont.description,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.45,
        height: 1.27,
      ),
    );
  }

  Widget _pontTitle(ClientPont pont) {
    return Text(
      pont.name,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.37,
        height: 1.19,
      ),
    );
  }

  Future<void> _onPontPressed(ClientPont pont) async {
    Log.d(_tag, '_onPontPressed: pont = $pont');

    await showPontBottomSheet(
      context: context,
      child: PontBottomSheet(pont: pont),
    );
  }

  Future<void> _onBuyPressed(ClientPont pont) async {
    Log.d(_tag, '_onBuyPressed: pont = $pont');

    await showPontBottomSheet(
      context: context,
      child: PontBottomSheet(pont: pont),
    );
  }
}
