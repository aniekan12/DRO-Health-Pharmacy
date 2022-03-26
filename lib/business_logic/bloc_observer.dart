// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  // @override
  // void onEvent(Bloc bloc, Object event) {
  //   print(event);
  //   super.onEvent(bloc, event);
  // }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}
