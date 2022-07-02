import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pont/cubits/login/login_page_cubit.dart';
import 'package:pont/cubits/login/login_page_state.dart';
import 'package:pont/images.dart';
import 'package:pont/pages/home_page.dart';
import 'package:pont/pages/nft_list_page.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:pont/utils/string_extension.dart';
import 'package:pont/widgets/bottom_button.dart';

const _tag = 'login_page';

class LoginPage extends StatefulWidget {
  static const routeName = 'login';

  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _cubit = LoginPageCubit();
  late LoginPageState _state;

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginPageCubit, LoginPageState>(
      bloc: _cubit,
      listener: (context, state) {},
      buildWhen: (LoginPageState previous, LoginPageState current) {
        if (previous.error != current.error && current.error.isNotNullOrEmpty) {
          final snackBar = SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              current.error!,
              style: const TextStyle(color: Colors.white),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (previous.openHomePage != current.openHomePage &&
            current.openHomePage) {
          Navigator.of(context).pushNamed(HomePage.routeName);
        }
        return true;
      },
      builder: (context, state) {
        _state = state;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(child: _body()),
        );
      },
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        _image(),
        const Spacer(),
        _title(),
        const SizedBox(height: 45),
        _button(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _image() {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PontImage.pontCircle(
            width: 212,
            height: 212,
          ),
          ClipOval(
            child: PontImage.login(
              width: 190,
              height: 190,
            ),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 33),
      child: Text(
        'Show\nYour\nNFT Arts',
        style: TextStyle(
          fontSize: 62,
          color: Colors.black,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.56,
          height: 0.98,
        ),
      ),
    );
  }

  Widget _button() {
    return BottomButton(
      onTap: _onLoginPressed,
      loading: _state.loading,
      text: 'Sign in',
    );
  }

  void _onLoginPressed() {
    Log.d(_tag, '_onLoginPressed');

    _cubit.login();
  }
}
