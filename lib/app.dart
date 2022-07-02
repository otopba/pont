import 'package:flutter/material.dart';
import 'package:pont/di.dart';
import 'package:pont/pages/buy_ok_page.dart';
import 'package:pont/pages/checkout_page.dart';
import 'package:pont/pages/home_page.dart';
import 'package:pont/pages/login_page.dart';
import 'package:pont/pages/logs_page.dart';
import 'package:pont/utils/string_extension.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pont',
      home: const LoginPage(),
      // home: const HomePage(),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        LogsPage.routeName: (context) => const LogsPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        CheckoutPage.routeName: (context) => const CheckoutPage(),
        BuyOk.routeName: (context) => const BuyOk(),
      },
      initialRoute: _initialRoute(),
    );
  }

  String _initialRoute() {
    final wallet = Di.instance.preferencesService.getWallet();

    if (wallet.isNullOrEmpty) {
      return LoginPage.routeName;
    } else {
      return HomePage.routeName;
    }
  }
}
