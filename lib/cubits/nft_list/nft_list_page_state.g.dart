// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_list_page_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NftListPageState extends NftListPageState {
  @override
  final bool loading;
  @override
  final BuiltList<ClientNft> nftList;
  @override
  final String? activeNftAddress;

  factory _$NftListPageState(
          [void Function(NftListPageStateBuilder)? updates]) =>
      (new NftListPageStateBuilder()..update(updates))._build();

  _$NftListPageState._(
      {required this.loading, required this.nftList, this.activeNftAddress})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        loading, r'NftListPageState', 'loading');
    BuiltValueNullFieldError.checkNotNull(
        nftList, r'NftListPageState', 'nftList');
  }

  @override
  NftListPageState rebuild(void Function(NftListPageStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NftListPageStateBuilder toBuilder() =>
      new NftListPageStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NftListPageState &&
        loading == other.loading &&
        nftList == other.nftList &&
        activeNftAddress == other.activeNftAddress;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, loading.hashCode), nftList.hashCode),
        activeNftAddress.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NftListPageState')
          ..add('loading', loading)
          ..add('nftList', nftList)
          ..add('activeNftAddress', activeNftAddress))
        .toString();
  }
}

class NftListPageStateBuilder
    implements Builder<NftListPageState, NftListPageStateBuilder> {
  _$NftListPageState? _$v;

  bool? _loading;
  bool? get loading => _$this._loading;
  set loading(bool? loading) => _$this._loading = loading;

  ListBuilder<ClientNft>? _nftList;
  ListBuilder<ClientNft> get nftList =>
      _$this._nftList ??= new ListBuilder<ClientNft>();
  set nftList(ListBuilder<ClientNft>? nftList) => _$this._nftList = nftList;

  String? _activeNftAddress;
  String? get activeNftAddress => _$this._activeNftAddress;
  set activeNftAddress(String? activeNftAddress) =>
      _$this._activeNftAddress = activeNftAddress;

  NftListPageStateBuilder();

  NftListPageStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _loading = $v.loading;
      _nftList = $v.nftList.toBuilder();
      _activeNftAddress = $v.activeNftAddress;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NftListPageState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NftListPageState;
  }

  @override
  void update(void Function(NftListPageStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NftListPageState build() => _build();

  _$NftListPageState _build() {
    _$NftListPageState _$result;
    try {
      _$result = _$v ??
          new _$NftListPageState._(
              loading: BuiltValueNullFieldError.checkNotNull(
                  loading, r'NftListPageState', 'loading'),
              nftList: nftList.build(),
              activeNftAddress: activeNftAddress);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'nftList';
        nftList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NftListPageState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
