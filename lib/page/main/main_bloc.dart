import 'dart:async';
import 'package:bloc/bloc.dart';

import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  static final MainBloc _singleton = MainBloc._internal();

  factory MainBloc() {
    return _singleton;
  }

  MainBloc._internal();

  MainState get initialState => MainState.initial();

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
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
