library login_state;

import 'package:meta/meta.dart';
import 'package:built_value/built_value.dart';
import 'package:mobile_assignment_meetai/model/user.dart';

part 'profile_state.g.dart';

abstract class ProfileState
    implements Built<ProfileState, ProfileStateBuilder> {
  @nullable
  User get vUser;
  String get vError;

  bool get sLoading => vError == '';
  bool get sSuccessful => vUser != null && vError == '';

  ProfileState._();

  factory ProfileState([updates(ProfileStateBuilder b)]) = _$ProfileState;

  factory ProfileState.initial() {
    return ProfileState((b) => b
      ..vUser = null
      ..vError = '');
  }

  factory ProfileState.success({
    @required User vUser,
  }) {
    return ProfileState((b) => b
      ..vUser = vUser
      ..vError = '');
  }

  factory ProfileState.failure({
    @required String vError,
  }) {
    return ProfileState((b) => b
      ..vUser = null
      ..vError = vError);
  }
}
