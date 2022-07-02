// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_page_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProfilePageState extends ProfilePageState {
  @override
  final bool loading;
  @override
  final String address;

  factory _$ProfilePageState(
          [void Function(ProfilePageStateBuilder)? updates]) =>
      (new ProfilePageStateBuilder()..update(updates))._build();

  _$ProfilePageState._({required this.loading, required this.address})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        loading, r'ProfilePageState', 'loading');
    BuiltValueNullFieldError.checkNotNull(
        address, r'ProfilePageState', 'address');
  }

  @override
  ProfilePageState rebuild(void Function(ProfilePageStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfilePageStateBuilder toBuilder() =>
      new ProfilePageStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfilePageState &&
        loading == other.loading &&
        address == other.address;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, loading.hashCode), address.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProfilePageState')
          ..add('loading', loading)
          ..add('address', address))
        .toString();
  }
}

class ProfilePageStateBuilder
    implements Builder<ProfilePageState, ProfilePageStateBuilder> {
  _$ProfilePageState? _$v;

  bool? _loading;
  bool? get loading => _$this._loading;
  set loading(bool? loading) => _$this._loading = loading;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  ProfilePageStateBuilder();

  ProfilePageStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _loading = $v.loading;
      _address = $v.address;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfilePageState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProfilePageState;
  }

  @override
  void update(void Function(ProfilePageStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProfilePageState build() => _build();

  _$ProfilePageState _build() {
    final _$result = _$v ??
        new _$ProfilePageState._(
            loading: BuiltValueNullFieldError.checkNotNull(
                loading, r'ProfilePageState', 'loading'),
            address: BuiltValueNullFieldError.checkNotNull(
                address, r'ProfilePageState', 'address'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
