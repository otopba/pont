import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pont/app.dart';
import 'package:pont/build_options.dart';
import 'package:pont/di.dart';
import 'package:pont/services/crashlytics/crashlytics_service.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

const _tag = 'main';

Future<void> main() async {
  setEnvironment(Environment.test);

  await runMain();
}

Future<void> runMain() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    CrashlyticsService.instance.init();

    final packageInfo = await PackageInfo.fromPlatform();
    Log.d(
      _tag,
      'runMain: ${describeEnum(defaultTargetPlatform)} v.${packageInfo.version}+${packageInfo.buildNumber}',
    );

    Di.instance.init();
    await Di.instance.preferencesService.init();

    runApp(const App());
  }, (error, StackTrace stackTrace) {
    CrashlyticsService.instance.onError(error, stackTrace: stackTrace);
  });
}
