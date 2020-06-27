library login_state;

import 'package:meta/meta.dart';
import 'package:built_value/built_value.dart';

part 'profile_state.g.dart';

abstract class ProfileState
    implements Built<ProfileState, ProfileStateBuilder> {
  String get vErrorMessage;
  String get vAuthProvide;

  bool get sLoading => vErrorMessage == '';
  bool get sLoggedInSuccessful => vAuthProvide != '' && vErrorMessage == '';

  ProfileState._();

  factory ProfileState([updates(ProfileStateBuilder b)]) = _$ProfileState;

  factory ProfileState.initial() {
    return ProfileState((b) => b
      ..vErrorMessage = ''
      ..vAuthProvide = '');
  }

  factory ProfileState.success({
    @required String vAuthProvide,
  }) {
    return ProfileState((b) => b
      ..vErrorMessage = ''
      ..vAuthProvide = vAuthProvide);
  }

  factory ProfileState.failure({
    @required String vErrorMessage,
  }) {
    return ProfileState((b) => b
      ..vErrorMessage = vErrorMessage
      ..vAuthProvide = '');
  }
}
