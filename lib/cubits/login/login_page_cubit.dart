import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pont/cubits/login/login_page_state.dart';
import 'package:pont/di.dart';
import 'package:pont/services/login_service.dart';
import 'package:pont/services/preferences_service.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:pont/utils/string_extension.dart';

const _tag = 'login_page_cubit';

class LoginPageCubit extends Cubit<LoginPageState> {
  final LoginService _loginService;
  final PreferencesService _prefs;
  Timer? _timer;
  late final StreamSubscription _walletSubscription;

  LoginPageCubit()
      : _loginService = Di.instance.loginService,
        _prefs = Di.instance.preferencesService,
        super(
          LoginPageState(
            (b) => b
              ..loading = false
              ..openNftListPage = false,
          ),
        ) {
    _init();
  }

  void _init() {
    Log.d(_tag, '_init');

    _walletSubscription =
        _prefs.walletStream.distinct().listen(_onWalletUpdate);
  }

  @override
  Future<void> close() async {
    await _walletSubscription.cancel();
    _timer?.cancel();
    _timer = null;
    await super.close();
  }

  void login() {
    Log.d(_tag, 'login');

    if (state.loading) return;

    _timer?.cancel();
    _timer = null;

    emit(
      state.rebuild(
        (b) => b
          ..loading = true
          ..error = null,
      ),
    );

    _timer = Timer(const Duration(seconds: 300), _onTimeout);

    _loginService.login();
  }

  void _onTimeout() {
    Log.d(_tag, '_onTimeout');

    _timer = null;

    emit(
      state.rebuild(
        (b) => b
          ..loading = false
          ..error = 'Timeout',
      ),
    );
  }

  void _onWalletUpdate(String? wallet) {
    Log.d(_tag, '_onWalletUpdate: wallet = $wallet');

    if (wallet.isNullOrEmpty) return;

    _timer?.cancel();
    _timer = null;

    emit(
      state.rebuild(
        (b) => b
          ..loading = false
          ..error = null
          ..openNftListPage = true,
      ),
    );
  }
}
