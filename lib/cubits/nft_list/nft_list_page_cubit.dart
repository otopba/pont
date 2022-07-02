import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pont/cubits/nft_list/nft_list_page_state.dart';
import 'package:pont/data/client/client_nft.dart';
import 'package:pont/di.dart';
import 'package:pont/repositories/nft_repository.dart';
import 'package:pont/services/preferences_service.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:built_collection/built_collection.dart';
import 'package:url_launcher/url_launcher.dart';

const _tag = 'nft_list_page_cubit';

class NftListPageCubit extends Cubit<NftListPageState> {
  final NftRepository _nftRepository;
  final PreferencesService _prefs;
  late final StreamSubscription _nftListSubscription;
  late final StreamSubscription _activeNftAddressSubscription;

  NftListPageCubit()
      : _nftRepository = Di.instance.nftRepository,
        _prefs = Di.instance.preferencesService,
        super(
          NftListPageState(
            (b) => b..loading = true,
          ),
        ) {
    _init();
  }

  Future<void> _init() async {
    Log.d(_tag, '_init');

    _nftListSubscription = _nftRepository.stream.listen(_onListUpdated);
    _nftRepository.loadNftList();

    _activeNftAddressSubscription =
        _prefs.activeNftAddressStream.listen(_onActiveNftAddressUpdated);
  }

  void _onActiveNftAddressUpdated(String? address) {
    if (state.activeNftAddress == address) return;

    emit(state.rebuild((b) => b..activeNftAddress = address));
  }

  void _onListUpdated(BuiltList<ClientNft> nftList) {
    Log.d(_tag, '_onListUpdated');

    final list = nftList.toList();
    list.sort((a, b) => a.address.compareTo(b.address));

    emit(
      state.rebuild(
        (b) => b
          ..nftList = list.toBuiltList().toBuilder()
          ..loading = false,
      ),
    );
  }

  void plusNft() {
    Log.d(_tag, 'plusNft');

    launchUrl(
      Uri.parse('https://getgems.io/'),
      mode: LaunchMode.externalNonBrowserApplication,
    );
  }

  @override
  Future<void> close() async {
    await _nftListSubscription.cancel();
    await _activeNftAddressSubscription.cancel();
    await super.close();
  }
}
