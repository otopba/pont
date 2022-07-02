import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pont/cubits/nft_bottom_sheet/nft_bottom_sheet_state.dart';
import 'package:pont/data/client/client_nft.dart';
import 'package:pont/di.dart';
import 'package:pont/services/nfc_service.dart';
import 'package:pont/services/preferences_service.dart';
import 'package:pont/utils/logs/log.dart';

const _tag = 'nft_bottom_sheet_cubit';

class NftBottomSheetCubit extends Cubit<NftBottomSheetState> {
  final PreferencesService _prefs;
  final NfcService _nfcService;

  NftBottomSheetCubit({required ClientNft nft})
      : _prefs = Di.instance.preferencesService,
        _nfcService = Di.instance.nfcService,
        super(
          NftBottomSheetState(
            (b) => b
              ..loading = false
              ..nft = nft.toBuilder(),
          ),
        ) {
    _init();
  }

  Future<void> _init() async {
    Log.d(_tag, '_init');
  }

  Future<bool> sync() async {
    Log.d(_tag, 'sync');

    emit(
      state.rebuild(
        (b) => b
          ..loading = true
          ..error = null,
      ),
    );

    await _nfcService.finish();

    final tag = await _nfcService.scan();

    if (tag == null) {
      emit(
        state.rebuild(
          (b) => b
            ..loading = false
            ..error = 'Scan failed',
        ),
      );
      await _nfcService.finish(iosErrorMessage: 'Scan failed');
      return false;
    }

    if (tag.ndefWritable != true) {
      emit(
        state.rebuild(
          (b) => b
            ..loading = false
            ..error = 'NDEF not writable',
        ),
      );
      await _nfcService.finish(iosErrorMessage: 'NDEF not writable');
      return false;
    }

    final Uint8List bytes;
    try {
      bytes = await _downloadFile(state.nft.image!);
    } catch (e, stackTrace) {
      Log.e(_tag, '_init: $e\n$stackTrace');

      await _nfcService.finish(iosErrorMessage: "Can't download image");
      emit(
        state.rebuild(
          (b) => b
            ..loading = false
            ..error = "Can't download image",
        ),
      );

      return false;
    }

    final writeResult = await _nfcService.write(bytes);

    if (!writeResult) {
      await _nfcService.finish(iosErrorMessage: 'Write failed');
      emit(
        state.rebuild(
          (b) => b
            ..loading = false
            ..error = 'Write failed',
        ),
      );

      return false;
    }

    await _nfcService.finish(iosAlertMessage: 'Success');
    emit(
      state.rebuild(
        (b) => b
          ..loading = false
          ..error = null,
      ),
    );

    await _prefs.setActiveNftAddress(state.nft.address);

    return true;
  }

  Future<Uint8List> _downloadFile(String url) async {
    Log.d(_tag, 'url = $url');

    final httpClient = HttpClient();

    final request = await httpClient.getUrl(Uri.parse(url));
    final response = await request.close();

    return await consolidateHttpClientResponseBytes(response);
  }
}
