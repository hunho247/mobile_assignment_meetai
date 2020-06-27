import 'dart:async';
import 'package:bloc/bloc.dart';

import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  static final ProfileBloc _singleton = ProfileBloc._internal();

  factory ProfileBloc() {
    return _singleton;
  }

  ProfileBloc._internal();

  ProfileState get initialState => ProfileState.initial();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    try {
      yield* event.applyAsync(bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield state;
    }
  }

  @override
  Future<void> close() {
    _singleton.close();
    return super.close();
  }
}
