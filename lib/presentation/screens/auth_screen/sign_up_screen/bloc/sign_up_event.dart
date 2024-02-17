part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpButtonPressed extends SignUpEvent {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpButtonPressed({
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [userName, email, password, confirmPassword];
}