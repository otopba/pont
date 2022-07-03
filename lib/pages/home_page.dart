import 'package:flutter/material.dart';
import 'package:pont/pages/nft_list_page.dart';
import 'package:pont/pages/profile_page.dart';
import 'package:pont/pages/shop_page.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:pont/widgets/app_menu.dart';

const _tag = 'home_page';

class HomePage extends StatefulWidget {
  static const routeName = 'home';

  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppMenuPage _activePage = AppMenuPage.nftList;

  final _shopPage = const ShopPage();
  final _nftListPage = const NftListPage();
  final _profilePage = const ProfilePage();

  @override
  Widget build(BuildContext context) {
    final Widget page;
    switch (_activePage) {
      case AppMenuPage.shop:
        page = _shopPage;
        break;
      case AppMenuPage.nftList:
        page = _nftListPage;
        break;
      case AppMenuPage.profile:
        page = _profilePage;
        break;
    }

    return Stack(
      children: [
        page,
        _menu(),
      ],
    );
  }

  Widget _menu() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        top: false,
        child: AppMenu(
          activePage: _activePage,
          onMenuPressed: _onMenuPressed,
        ),
      ),
    );
  }

  void _onMenuPressed(AppMenuPage page) {
    Log.d(_tag, '_onMenuPressed: page = $page');

    if (_activePage == page) return;

    setState(() {
      _activePage = page;
    });
  }
}
