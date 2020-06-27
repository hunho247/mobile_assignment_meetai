import 'dart:async';
import 'package:meta/meta.dart';

import 'main_bloc.dart';
import 'main_state.dart';

@immutable
abstract class MainEvent {
  Stream<MainState> applyAsync({MainBloc bloc});
}

class LoggingInMainEvent extends MainEvent {
  final String authProvide;

  LoggingInMainEvent(this.authProvide);

  @override
  Stream<MainState> applyAsync({MainBloc bloc}) async* {
    try {} catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield MainState.failure(vErrorMessage: _?.toString());
    }
  }
}

class LoggingOutMainEvent extends MainEvent {
  @override
  Stream<MainState> applyAsync({MainBloc bloc}) async* {
    try {} catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield MainState.failure(vErrorMessage: _?.toString());
    }
  }
}
