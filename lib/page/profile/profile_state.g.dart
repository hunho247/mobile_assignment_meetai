// GENERATED CODE - DO NOT MODIFY BY HAND

part of login_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProfileState extends ProfileState {
  @override
  final String vErrorMessage;
  @override
  final String vAuthProvide;

  factory _$ProfileState([void Function(ProfileStateBuilder) updates]) =>
      (new ProfileStateBuilder()..update(updates)).build();

  _$ProfileState._({this.vErrorMessage, this.vAuthProvide}) : super._() {
    if (vErrorMessage == null) {
      throw new BuiltValueNullFieldError('ProfileState', 'vErrorMessage');
    }
    if (vAuthProvide == null) {
      throw new BuiltValueNullFieldError('ProfileState', 'vAuthProvide');
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
        vErrorMessage == other.vErrorMessage &&
        vAuthProvide == other.vAuthProvide;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, vErrorMessage.hashCode), vAuthProvide.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProfileState')
          ..add('vErrorMessage', vErrorMessage)
          ..add('vAuthProvide', vAuthProvide))
        .toString();
  }
}

class ProfileStateBuilder
    implements Builder<ProfileState, ProfileStateBuilder> {
  _$ProfileState _$v;

  String _vErrorMessage;
  String get vErrorMessage => _$this._vErrorMessage;
  set vErrorMessage(String vErrorMessage) =>
      _$this._vErrorMessage = vErrorMessage;

  String _vAuthProvide;
  String get vAuthProvide => _$this._vAuthProvide;
  set vAuthProvide(String vAuthProvide) => _$this._vAuthProvide = vAuthProvide;

  ProfileStateBuilder();

  ProfileStateBuilder get _$this {
    if (_$v != null) {
      _vErrorMessage = _$v.vErrorMessage;
      _vAuthProvide = _$v.vAuthProvide;
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
    final _$result = _$v ??
        new _$ProfileState._(
            vErrorMessage: vErrorMessage, vAuthProvide: vAuthProvide);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
