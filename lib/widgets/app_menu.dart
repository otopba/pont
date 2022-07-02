import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pont/images.dart';
import 'package:pont/pages/nft_list_page.dart';
import 'package:pont/pages/profile_page.dart';
import 'package:pont/pages/shop_page.dart';
import 'package:pont/utils/logs/log.dart';

const _tag = 'app_menu';

enum AppMenuType {
  shop,
  nftList,
  profile,
}

class AppMenu extends StatelessWidget {
  const AppMenu({Key? key, required this.activeType}) : super(key: key);

  final AppMenuType activeType;

  @override
  Widget build(BuildContext context) {
    final list = <Widget>[];
    for (int i = 0; i < AppMenuType.values.length; i++) {
      list.add(_menuItem(context, AppMenuType.values[i]));
      if (i != AppMenuType.values.length - 1) {
        list.add(const SizedBox(width: 2));
      }
    }
    return IntrinsicWidth(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(45)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              offset: const Offset(0, 8),
              blurRadius: 32,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
        child: Row(
          children: list,
        ),
      ),
    );
  }

  Widget _menuItem(BuildContext context, AppMenuType type) {
    final selected = type == activeType;
    Widget child;
    switch (type) {
      case AppMenuType.shop:
        if (selected) {
          child = PontImage.shopActive(width: 60, height: 60);
        } else {
          child = PontImage.shop(width: 60, height: 60);
        }
        break;
      case AppMenuType.nftList:
        if (selected) {
          child = PontImage.nftListActive(width: 60, height: 60);
        } else {
          child = PontImage.nftList(width: 60, height: 60);
        }
        break;
      case AppMenuType.profile:
        if (selected) {
          child = PontImage.profileActive(width: 60, height: 60);
        } else {
          child = PontImage.profile(width: 60, height: 60);
        }
        break;
    }
    return GestureDetector(
      onTap: () => _onMenuPressed(context, type),
      child: child,
    );
  }

  void _onMenuPressed(BuildContext context, AppMenuType type) {
    Log.d(_tag, '_onMenuPressed: type = $type');

    if (type == activeType) return;

    final String routeName;

    switch (type) {
      case AppMenuType.shop:
        routeName = ShopPage.routeName;
        break;
      case AppMenuType.nftList:
        routeName = NftListPage.routeName;
        break;
      case AppMenuType.profile:
        routeName = ProfilePage.routeName;
        break;
    }

    Navigator.of(context).pushReplacementNamed(routeName);
  }
}
