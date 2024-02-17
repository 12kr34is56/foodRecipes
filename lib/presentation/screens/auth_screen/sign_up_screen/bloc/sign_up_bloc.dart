import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes/data/login_auth_api.dart';
import 'package:food_recipes/domain/repository/authentication_repository/authentication_repository.dart';
import 'package:food_recipes/domain/usecases/usecases.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {

  AuthenticationRepositoryImpl _repository;

  SignUpBloc(this._repository) : super(SignUpState.initial()) {
    on<SignUpButtonPressed>(signUpButtonPressed);
  }

  Future<FutureOr<void>> signUpButtonPressed(SignUpButtonPressed event, Emitter<SignUpState> emit) async {
    try{
      emit(state.copyWith(isLoading: true , errorMessage: ""));

      await SignUpUseCase(_repository).execute(event.email , event.password);

      emit(state.copyWith(isLoading: false,isSignUpSuccessful: true));

    }catch(e){
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Sign-up failed. Please try again.',
      ));
    }
  }
}
