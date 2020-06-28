import 'dart:async';
import 'package:meta/meta.dart';
import 'package:mobile_assignment_meetai/model/user.dart';
import 'package:mobile_assignment_meetai/provider/user_provider.dart';

import 'profile_bloc.dart';
import 'profile_state.dart';

@immutable
abstract class ProfileEvent {
  Stream<ProfileState> applyAsync({ProfileBloc bloc});
}

class LoadingProfileEvent extends ProfileEvent {
  final String username;

  LoadingProfileEvent(this.username);

  @override
  Stream<ProfileState> applyAsync({ProfileBloc bloc}) async* {
    try {
      User user = await UserProvider.getUser(username);
      yield ProfileState.success(vUser: user);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield ProfileState.failure(vError: _?.toString());
    }
  }
}
