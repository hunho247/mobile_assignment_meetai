import 'dart:async';
import 'package:meta/meta.dart';

import 'profile_bloc.dart';
import 'profile_state.dart';

@immutable
abstract class ProfileEvent {
  Stream<ProfileState> applyAsync({ProfileBloc bloc});
}

class LoggingInProfileEvent extends ProfileEvent {
  final String authProvide;

  LoggingInProfileEvent(this.authProvide);

  @override
  Stream<ProfileState> applyAsync({ProfileBloc bloc}) async* {
    try {} catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield ProfileState.failure(vErrorMessage: _?.toString());
    }
  }
}

class LoggingOutProfileEvent extends ProfileEvent {
  @override
  Stream<ProfileState> applyAsync({ProfileBloc bloc}) async* {
    try {} catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield ProfileState.failure(vErrorMessage: _?.toString());
    }
  }
}
