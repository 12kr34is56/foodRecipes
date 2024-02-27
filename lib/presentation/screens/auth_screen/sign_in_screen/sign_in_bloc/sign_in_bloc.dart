import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes/domain/repository/authentication_repository/authentication_repository.dart';
import 'package:meta/meta.dart';
import 'package:food_recipes/domain/usecases/usecases.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {

  AuthenticationRepositoryImpl _repository;

  SignInBloc(this._repository) : super(const SignInState()) {
    on<LoginPressedEvent>(loginPressedEvent);
    on<GooglePressedEvent>(googlePressedEvent);
    on<ForgotPressedEvent>(forgotPressedEvent);
  }


  Future<FutureOr<void>> loginPressedEvent(
      LoginPressedEvent event, Emitter<SignInState> emit) async {
    try {
      emit(const SignInState(status: SignInStatus.loading));

      await SignInUseCase(_repository).execute(event.email, event.password);

      emit(const SignInState(status: SignInStatus.success));
    } catch (e) {
      emit(SignInState(status: SignInStatus.failure, failure: e.toString()));
    }
  }

  Future<FutureOr<void>> googlePressedEvent(
      GooglePressedEvent event, Emitter<SignInState> emit) async {
    try {
      emit(const SignInState(status: SignInStatus.loading));

      await SignInWithGoogleUseCase(_repository).execute();

      emit(const SignInState(status: SignInStatus.success));
    } catch (e) {
      emit(SignInState(status: SignInStatus.failure, failure: e.toString()));
    }
  }

  Future<FutureOr<void>> forgotPressedEvent(ForgotPressedEvent event, Emitter<SignInState> emit) async {
    try {
      emit(const SignInState(status: SignInStatus.loading));

      await ForgotPasswordUseCase(_repository).execute(event.email);

      emit(const SignInState(status: SignInStatus.success));
    } catch (e) {
      emit(SignInState(status: SignInStatus.failure, failure: e.toString()));
    }
  }
}
