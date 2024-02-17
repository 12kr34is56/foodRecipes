import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'on_board_screen_event.dart';
part 'on_board_screen_state.dart';



class OnBoardScreenBloc extends Bloc<OnBoardScreenEvent, OnBoardScreenState> {
  OnBoardScreenBloc() : super(const OnBoardScreenState()) {
    on<NavigationToSignIn>(navigationToSignIn);
    on<NavigationToSignUp>(navigationToSignUp);
  }

  FutureOr<void> navigationToSignIn(NavigationToSignIn event, Emitter<OnBoardScreenState> emit) {
    emit(state.copyWith(screens: '/signIn'));
  }

  FutureOr<void> navigationToSignUp(NavigationToSignUp event, Emitter<OnBoardScreenState> emit) {
    emit(state.copyWith(screens: '/signUp'));
  }

}
