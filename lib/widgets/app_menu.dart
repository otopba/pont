import 'package:flutter/material.dart';
import 'package:pont/images.dart';

enum AppMenuPage {
  shop,
  nftList,
  profile,
}

class AppMenu extends StatelessWidget {
  const AppMenu({
    Key? key,
    this.onMenuPressed,
    required this.activePage,
  }) : super(key: key);

  final ValueSetter<AppMenuPage>? onMenuPressed;
  final AppMenuPage activePage;

  @override
  Widget build(BuildContext context) {
    final list = <Widget>[];
    for (int i = 0; i < AppMenuPage.values.length; i++) {
      list.add(_menuItem(AppMenuPage.values[i]));
      if (i != AppMenuPage.values.length - 1) {
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

  Widget _menuItem(AppMenuPage page) {
    final selected = page == activePage;
    Widget child;
    switch (page) {
      case AppMenuPage.shop:
        if (selected) {
          child = PontImage.shopActive(width: 60, height: 60);
        } else {
          child = PontImage.shop(width: 60, height: 60);
        }
        break;
      case AppMenuPage.nftList:
        if (selected) {
          child = PontImage.nftListActive(width: 60, height: 60);
        } else {
          child = PontImage.nftList(width: 60, height: 60);
        }
        break;
      case AppMenuPage.profile:
        if (selected) {
          child = PontImage.profileActive(width: 60, height: 60);
        } else {
          child = PontImage.profile(width: 60, height: 60);
        }
        break;
    }
    return GestureDetector(
      onTap: () => onMenuPressed?.call(page),
      child: child,
    );
  }
}
