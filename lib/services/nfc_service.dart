import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:ndef/ndef.dart' as ndef;

const _tag = 'nfc_service';

class NfcService {
  NfcService() {
    _init();
  }

  Future<void> _init() async {
    Log.d(_tag, '_init');

    final nfcAvailability = await FlutterNfcKit.nfcAvailability;

    Log.d(_tag, 'nfcAvailability = $nfcAvailability');
  }

  Future<void> finish({
    String? iosAlertMessage,
    String? iosErrorMessage,
  }) async {
    Log.d(_tag, 'finish');

    await FlutterNfcKit.finish(
      iosAlertMessage: iosAlertMessage,
      iosErrorMessage: iosErrorMessage,
    );
  }

  Future<NFCTag?> scan() async {
    Log.d(_tag, 'scan');

    final NFCTag tag;
    try {
      tag = await FlutterNfcKit.poll(
        timeout: const Duration(seconds: 10),
        readIso14443A: true,
        readIso14443B: true,
        readIso18092: false,
        readIso15693: true,
        probeWebUSBMagic: false,
      );
    } catch (e, stackTrace) {
      Log.d(_tag, 'scan: $e\n$stackTrace');
      await FlutterNfcKit.finish();
      return null;
    }

    Log.d(_tag, 'scan: tag = ${jsonEncode(tag)}');

    await FlutterNfcKit.setIosAlertMessage("Scan success");

    return tag;
  }

  Future<bool> write(Uint8List bytes) async {
    Log.d(_tag, 'write: bytes = ${bytes.length}');

    final list = <ndef.NDEFRecord>[];

    int chunkSize = 1000;
    for (var i = 0; i < bytes.length; i += chunkSize) {
      final subList = bytes.sublist(
        i,
        i + chunkSize > bytes.length ? bytes.length : i + chunkSize,
      );
      list.add(ndef.TextRecord(language: 'en', text: subList.join('')));
    }

    try {
      await FlutterNfcKit.writeNDEFRecords(list);
    } catch (e, stackTrace) {
      Log.d(_tag, 'write: $e\n$stackTrace');
      return false;
    }

    return true;
  }
}
