import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingObserver extends BlocObserver {

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
    print("Transition: $transition");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(bloc, error, stackTrace);
    print("Error: $error");
  }
}