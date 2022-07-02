// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_bottom_sheet_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NftBottomSheetState extends NftBottomSheetState {
  @override
  final bool loading;
  @override
  final ClientNft nft;
  @override
  final String? error;

  factory _$NftBottomSheetState(
          [void Function(NftBottomSheetStateBuilder)? updates]) =>
      (new NftBottomSheetStateBuilder()..update(updates))._build();

  _$NftBottomSheetState._(
      {required this.loading, required this.nft, this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        loading, r'NftBottomSheetState', 'loading');
    BuiltValueNullFieldError.checkNotNull(nft, r'NftBottomSheetState', 'nft');
  }

  @override
  NftBottomSheetState rebuild(
          void Function(NftBottomSheetStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NftBottomSheetStateBuilder toBuilder() =>
      new NftBottomSheetStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NftBottomSheetState &&
        loading == other.loading &&
        nft == other.nft &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, loading.hashCode), nft.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NftBottomSheetState')
          ..add('loading', loading)
          ..add('nft', nft)
          ..add('error', error))
        .toString();
  }
}

class NftBottomSheetStateBuilder
    implements Builder<NftBottomSheetState, NftBottomSheetStateBuilder> {
  _$NftBottomSheetState? _$v;

  bool? _loading;
  bool? get loading => _$this._loading;
  set loading(bool? loading) => _$this._loading = loading;

  ClientNftBuilder? _nft;
  ClientNftBuilder get nft => _$this._nft ??= new ClientNftBuilder();
  set nft(ClientNftBuilder? nft) => _$this._nft = nft;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  NftBottomSheetStateBuilder();

  NftBottomSheetStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _loading = $v.loading;
      _nft = $v.nft.toBuilder();
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NftBottomSheetState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NftBottomSheetState;
  }

  @override
  void update(void Function(NftBottomSheetStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NftBottomSheetState build() => _build();

  _$NftBottomSheetState _build() {
    _$NftBottomSheetState _$result;
    try {
      _$result = _$v ??
          new _$NftBottomSheetState._(
              loading: BuiltValueNullFieldError.checkNotNull(
                  loading, r'NftBottomSheetState', 'loading'),
              nft: nft.build(),
              error: error);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'nft';
        nft.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NftBottomSheetState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
