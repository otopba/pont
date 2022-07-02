import 'package:pont/utils/logs/log.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _tag = 'preferences_service';

class PreferencesService {
  bool _initCalled = false;
  late final SharedPreferences _prefs;

  final _walletSubject = BehaviorSubject<String?>();
  final _activeNftAddressSubject = BehaviorSubject<String?>();

  static const _walletKey = 'WALLET';
  static const _activeNftAddressKey = 'ACTIVE_NFT_ADDRESS';

  Stream<String?> get walletStream => _walletSubject;

  Stream<String?> get activeNftAddressStream => _activeNftAddressSubject;

  Future<void> init() async {
    Log.d(_tag, 'init');

    if (_initCalled) return;

    _initCalled = true;

    _prefs = await SharedPreferences.getInstance();

    final wallet = getWallet();
    _walletSubject.add(wallet);
  }

  Future<void> dispose() async {
    Log.d(_tag, 'dispose');

    await _walletSubject.close();
    await _activeNftAddressSubject.close();
  }

  String? getActiveNftAddress() {
    return _prefs.getString(_activeNftAddressKey);
  }

  Future<bool> setActiveNftAddress(String? activeNftAddress) async {
    _activeNftAddressSubject.add(activeNftAddress);
    return _prefs.setStringSafe(_activeNftAddressKey, activeNftAddress);
  }

  String? getWallet() {
    return _prefs.getString(_walletKey);
  }

  Future<bool> setWallet(String? wallet) async {
    _walletSubject.add(wallet);
    return _prefs.setStringSafe(_walletKey, wallet);
  }

  Future<void> clearAll() async {
    await _prefs.clear();
    _walletSubject.add(null);
    _activeNftAddressSubject.add(null);
  }
}

extension SharedPreferencesEx on SharedPreferences {
  Future<bool> setBoolSafe(String key, bool? value) {
    if (value == null) {
      return remove(key);
    } else {
      return setBool(key, value);
    }
  }

  Future<bool> setDoubleSafe(String key, double? value) {
    if (value == null) {
      return remove(key);
    } else {
      return setDouble(key, value);
    }
  }

  Future<bool> setIntSafe(String key, int? value) {
    if (value == null) {
      return remove(key);
    } else {
      return setInt(key, value);
    }
  }

  Future<bool> setStringSafe(String key, String? value) {
    if (value == null) {
      return remove(key);
    } else {
      return setString(key, value);
    }
  }

  Future<bool> setStringListSafe(String key, List<String>? value) {
    if (value == null) {
      return remove(key);
    } else {
      return setStringList(key, value);
    }
  }
}
