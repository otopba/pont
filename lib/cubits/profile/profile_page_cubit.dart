import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pont/cubits/profile/profile_page_state.dart';
import 'package:pont/di.dart';
import 'package:pont/repositories/nft_repository.dart';
import 'package:pont/services/preferences_service.dart';
import 'package:pont/utils/logs/log.dart';

const _tag = 'profile_page_cubit';

class ProfilePageCubit extends Cubit<ProfilePageState> {
  final NftRepository _nftRepository;
  final PreferencesService _prefs;

  ProfilePageCubit()
      : _nftRepository = Di.instance.nftRepository,
        _prefs = Di.instance.preferencesService,
        super(
          ProfilePageState(
            (b) => b
              ..loading = false
              ..address = Di.instance.preferencesService.getWallet(),
          ),
        ) {
    _init();
  }

  Future<void> _init() async {
    Log.d(_tag, '_init');
  }

  Future<bool> exit() async {
    Log.d(_tag, 'exit');

    if (state.loading) return false;

    emit(state.rebuild((b) => b..loading = true));

    await _nftRepository.clearDb();
    await _prefs.clearAll();

    emit(state.rebuild((b) => b..loading = false));

    return true;
  }
}
