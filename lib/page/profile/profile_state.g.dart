// GENERATED CODE - DO NOT MODIFY BY HAND

part of login_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProfileState extends ProfileState {
  @override
  final User vUser;
  @override
  final String vError;

  factory _$ProfileState([void Function(ProfileStateBuilder) updates]) =>
      (new ProfileStateBuilder()..update(updates)).build();

  _$ProfileState._({this.vUser, this.vError}) : super._() {
    if (vError == null) {
      throw new BuiltValueNullFieldError('ProfileState', 'vError');
    }
  }

  @override
  ProfileState rebuild(void Function(ProfileStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileStateBuilder toBuilder() => new ProfileStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileState &&
        vUser == other.vUser &&
        vError == other.vError;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, vUser.hashCode), vError.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProfileState')
          ..add('vUser', vUser)
          ..add('vError', vError))
        .toString();
  }
}

class ProfileStateBuilder
    implements Builder<ProfileState, ProfileStateBuilder> {
  _$ProfileState _$v;

  User _vUser;
  User get vUser => _$this._vUser;
  set vUser(User vUser) => _$this._vUser = vUser;

  String _vError;
  String get vError => _$this._vError;
  set vError(String vError) => _$this._vError = vError;

  ProfileStateBuilder();

  ProfileStateBuilder get _$this {
    if (_$v != null) {
      _vUser = _$v.vUser;
      _vError = _$v.vError;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProfileState;
  }

  @override
  void update(void Function(ProfileStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProfileState build() {
    final _$result = _$v ?? new _$ProfileState._(vUser: vUser, vError: vError);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
