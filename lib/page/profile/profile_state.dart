library login_state;

import 'package:meta/meta.dart';
import 'package:built_value/built_value.dart';
import 'package:mobile_assignment_meetai/model/moment.dart';
import 'package:mobile_assignment_meetai/model/user.dart';

part 'profile_state.g.dart';

abstract class ProfileState
    implements Built<ProfileState, ProfileStateBuilder> {
  @nullable
  User get vUser;
  @nullable
  Moment get vMoment;
  String get vError;

  bool get sLoadingSuccessUser => vUser != null;
  bool get sLoadingSuccessMoment => vMoment != null;
  bool get sFailed => vError != '';

  ProfileState._();

  factory ProfileState([updates(ProfileStateBuilder b)]) = _$ProfileState;

  factory ProfileState.initial() {
    return ProfileState((b) => b
      ..vUser = null
      ..vMoment = null
      ..vError = '');
  }

  factory ProfileState.success({
    @required User vUser,
    @required Moment vMoment,
  }) {
    return ProfileState((b) => b
      ..vUser = vUser
      ..vMoment = vMoment
      ..vError = '');
  }

  factory ProfileState.failure({
    @required String vError,
  }) {
    return ProfileState((b) => b
      ..vUser = null
      ..vMoment = null
      ..vError = vError);
  }
}
