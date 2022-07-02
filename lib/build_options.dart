import 'dart:io';

bool get flutterTestRunning => Platform.environment.containsKey('FLUTTER_TEST');

enum Environment {
  test,
  prod,
}

void setEnvironment(Environment build) {
  switch (build) {
    case Environment.test:
      buildConfig = BuildConfig.test;
      break;
    case Environment.prod:
      buildConfig = BuildConfig.prod;
      break;
  }
}

late final BuildConfig buildConfig;

class BuildConfig {
  BuildConfig({
    required this.logsEnabled,
    required this.tonConnectPath,
  });

  static final test = BuildConfig(
    logsEnabled: true,
    tonConnectPath: "us-central1-pont-68d4e.cloudfunctions.net/tonConnect",
  );
  static final prod = BuildConfig(
    logsEnabled: false,
    tonConnectPath: "us-central1-pont-68d4e.cloudfunctions.net/tonConnect",
  );

  final bool logsEnabled;
  final String tonConnectPath;
}
