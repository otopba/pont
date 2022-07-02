import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pont/build_options.dart';
import 'package:pont/data/firestore_mapper.dart';
import 'package:pont/data/server/server_session.dart';
import 'package:pont/services/preferences_service.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';
import 'package:pont/utils/string_extension.dart';

const _tag = 'login_service';

class LoginService {
  final PreferencesService _prefs;
  final _uuid = const Uuid();
  final _firestore = FirebaseFirestore.instance;
  StreamSubscription? _sessionSubscription;

  LoginService({required PreferencesService prefs}) : _prefs = prefs {
    _init();
  }

  void _init() {
    Log.d(_tag, '_init');
  }

  void dispose() {
    Log.d(_tag, 'dispose');

    _sessionSubscription?.cancel();
    _sessionSubscription = null;
  }

  void login() {
    Log.d(_tag, 'login');

    final session = _createSession();

    launchUrl(
      Uri.parse(
        'https://app.tonkeeper.com/ton-login/${buildConfig.tonConnectPath}?session=$session',
      ),
      mode: LaunchMode.externalNonBrowserApplication,
    );
  }

  String _createSession() {
    Log.d(_tag, '_createSession');

    _sessionSubscription?.cancel();
    _sessionSubscription = null;

    final session = _uuid.v4();

    Log.d(_tag, '_createSession: session = $session');

    _sessionSubscription = _firestore
        .collection('session')
        .doc(session)
        .withConverter(
          fromFirestore: mapFirestoreToModel<ServerSession>,
          toFirestore: mapToFirestoreModel<ServerSession>,
        )
        .snapshots()
        .map((it) => it.data())
        .where((it) => it != null)
        .cast<ServerSession>()
        .distinct()
        .listen(_onSessionReceive);

    return session;
  }

  void _onSessionReceive(ServerSession session) {
    Log.d(_tag, '_onSessionReceive: session = $session');

    final address = session.address;

    if (address.isNullOrEmpty) return;

    _prefs.setWallet(address);
  }
}
