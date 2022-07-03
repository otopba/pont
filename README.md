# pont

The project was made as part of [Hack-a-TON](https://t.me/toncontests/40)

pont is:

1) Keychain that can display an image
2) Mobile application that uploads NFT to the keychain

How it works?

1) You log in to the application in your wallet using TON Connect
2) The app downloads a list of all your NFTs
3) You choose the NFT that you want to upload to the device
4) Bring the phone to the device and the image is transmitted via NFC

In this repository you will find the code:

1) [Mobile application (ios + android)](./lib)
2) [Server to work with TON Connet](./server/)
3) [Code for embed microcontroller](./embedded)


# Testing

- android: [app-release.apk](./app-release.apk)
- ios: [testflight](https://testflight.apple.com/join/5oHeExtj)


## Developer Tips

### Run code generation

```bash
flutter packages pub run build_runner build
```

### pod m1

```bash
arch -x86_64 pod update
```

```bash
arch -x86_64 pod install
```

### Icon generations

```bash
flutter pub run flutter_launcher_icons:main
```