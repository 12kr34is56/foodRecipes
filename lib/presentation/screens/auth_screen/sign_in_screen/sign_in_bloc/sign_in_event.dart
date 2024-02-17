part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class LoginPressedEvent extends SignInEvent {
  final String email;
  final String password;

  LoginPressedEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class GooglePressedEvent extends SignInEvent {
  @override
  List<Object> get props => [];
}

class ForgotPressedEvent extends SignInEvent {
  final String email;

  ForgotPressedEvent({required this.email});

  @override
  List<Object> get props => [email];
}
