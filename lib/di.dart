import 'package:get_it/get_it.dart';
import 'package:pont/repositories/nft_repository.dart';
import 'package:pont/services/api/api_service.dart';
import 'package:pont/services/dynamic_link_service.dart';
import 'package:pont/services/login_service.dart';
import 'package:pont/services/nfc_service.dart';
import 'package:pont/services/preferences_service.dart';
import 'package:pont/utils/logs/log.dart';

const _tag = 'di';

class Di {
  static Di instance = Di._();

  Di._();

  final _getIt = GetIt.instance;
  bool _initCalled = false;

  void init() {
    if (_initCalled) return;

    _initCalled = true;

    Log.d(_tag, '_init');

    _getIt.registerSingleton<PreferencesService>(
      PreferencesService(),
      dispose: (it) => it.dispose(),
    );
    _getIt.registerSingleton<NfcService>(NfcService());
    _getIt.registerSingleton<ApiService>(ApiService());
    _getIt.registerSingleton<NftRepository>(
      NftRepository(
        apiService: apiService,
        prefs: preferencesService,
      ),
      dispose: (it) => it.dispose(),
    );
    _getIt.registerSingleton<DynamicLinkService>(
      DynamicLinkService(),
      dispose: (it) => it.dispose(),
    );
    _getIt.registerSingleton<LoginService>(
      LoginService(prefs: preferencesService),
      dispose: (it) => it.dispose(),
    );
  }

  PreferencesService get preferencesService => _getIt.get<PreferencesService>();

  NfcService get nfcService => _getIt.get<NfcService>();

  ApiService get apiService => _getIt.get<ApiService>();

  NftRepository get nftRepository => _getIt.get<NftRepository>();

  DynamicLinkService get dynamicLinkService => _getIt.get<DynamicLinkService>();

  LoginService get loginService => _getIt.get<LoginService>();
}
