library login_state;

import 'package:meta/meta.dart';
import 'package:built_value/built_value.dart';

part 'main_state.g.dart';

abstract class MainState implements Built<MainState, MainStateBuilder> {
  String get vErrorMessage;
  String get vAuthProvide;

  bool get sLoading => vErrorMessage == '';
  bool get sLoggedInSuccessful => vAuthProvide != '' && vErrorMessage == '';

  MainState._();

  factory MainState([updates(MainStateBuilder b)]) = _$MainState;

  factory MainState.initial() {
    return MainState((b) => b
      ..vErrorMessage = ''
      ..vAuthProvide = '');
  }

  factory MainState.success({
    @required String vAuthProvide,
  }) {
    return MainState((b) => b
      ..vErrorMessage = ''
      ..vAuthProvide = vAuthProvide);
  }

  factory MainState.failure({
    @required String vErrorMessage,
  }) {
    return MainState((b) => b
      ..vErrorMessage = vErrorMessage
      ..vAuthProvide = '');
  }
}
