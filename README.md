# Testing

- android: app-release.apk inside repo
- ios: testflight https://testflight.apple.com/join/5oHeExtj

# Developer Tips

## Run code generation

```bash
flutter packages pub run build_runner build
```

## pod m1

```bash
arch -x86_64 pod update
```

```bash
arch -x86_64 pod install
```

## Icon generations

```bash
flutter pub run flutter_launcher_icons:main
```