import 'dart:async';
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pont/data/client/client_nft.dart';
import 'package:pont/data/serializers.dart';
import 'package:pont/data/server/server_nft.dart';
import 'package:pont/services/api/api_service.dart';
import 'package:pont/services/preferences_service.dart';
import 'package:pont/utils/logs/log.dart';
import 'package:rxdart/rxdart.dart';
import 'package:built_collection/built_collection.dart';

const _tag = 'nft_repository';

class NftRepository {
  static const _nftListBox = 'nft_list';
  final ApiService _apiService;
  final PreferencesService _prefs;
  final _subject = BehaviorSubject<BuiltList<ClientNft>>();
  final _hiveReady = Completer();

  Stream<BuiltList<ClientNft>> get stream => _subject;

  NftRepository({
    required ApiService apiService,
    required PreferencesService prefs,
  })  : _apiService = apiService,
        _prefs = prefs {
    _init();
  }

  Future<void> _init() async {
    Log.d(_tag, '_init');

    await Hive.initFlutter();

    _hiveReady.complete();
  }

  Future<void> dispose() async {
    Log.d(_tag, 'dispose');

    await _subject.close();
  }

  Future<void> loadNftList() async {
    Log.d(_tag, 'loadNftList: started');

    final dbResult = await _loadFromDb();
    Log.d(_tag, 'loadNftList: dbResult = $dbResult');
    _subject.add(dbResult);

    final apiResponse = await _apiService.getItemsByOwnerAddress(
      _prefs.getWallet()!,
    );
    final apiResult = apiResponse.nftItems.map(_mapNft).toBuiltList();
    Log.d(_tag, 'loadNftList: apiResult = $apiResult');
    _subject.add(apiResult);

    await _saveToDb(apiResult);

    Log.d(_tag, 'loadNftList: finished');
  }

  Future<void> _saveToDb(BuiltList<ClientNft> list) async {
    Log.d(_tag, '_saveToDb: list = $list');

    await _hiveReady.future;

    final box = await Hive.openBox(_nftListBox);

    for (final nft in list) {
      await box.put(nft.address, jsonEncode(serialize(nft)));
    }
  }

  Future<BuiltList<ClientNft>> _loadFromDb() async {
    Log.d(_tag, '_loadFromDb');

    await _hiveReady.future;

    final box = await Hive.openBox(_nftListBox);

    final result = box
        .toMap()
        .values
        .map((it) => deserialize<ClientNft>(jsonDecode(it)))
        .where((it) => it != null)
        .cast<ClientNft>()
        .toBuiltList();

    return result;
  }

  ClientNft _mapNft(ServerNft serverNft) {
    return ClientNft(
      (b) => b
        ..address = serverNft.address
        ..name = serverNft.metadata.name
        ..description = serverNft.metadata.description
        ..image = serverNft.metadata.image
        ..marketplace = serverNft.metadata.marketplace,
    );
  }

  Future<void> clearDb() async {
    await _hiveReady.future;

    final box = await Hive.openBox(_nftListBox);

    await box.clear();

    _subject.add(BuiltList<ClientNft>());
  }
}
