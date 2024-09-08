import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class HoroscopeBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('ONTRANSITION ');
    log('Bloc: ${bloc.runtimeType}');
    log('Event: ${transition.event.runtimeType}');
    log('Transition: ${transition.currentState.runtimeType} => ${transition.nextState.runtimeType}');
    log('New State: ${transition.nextState.runtimeType}');
    super.onTransition(bloc, transition);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('ONEVENT ');
    log('Bloc: ${bloc.runtimeType}');
    log('Event: ${event.runtimeType}');
    log('Details: ${event.toString()}');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('ONERROR');

    log('Bloc: ${bloc.runtimeType}');
    log('Error: ${error.toString()}');

    super.onError(bloc, error, stackTrace);
  }
}
