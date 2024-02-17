part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final bool isLoading;
  final String errorMessage;
  final bool isSignUpSuccessful;

  const SignUpState({
    required this.isLoading,
    required this.errorMessage,
    required this.isSignUpSuccessful
  });

  factory SignUpState.initial() {
    return const SignUpState(
      isLoading: false,
      errorMessage: '',
      isSignUpSuccessful: false
    );
  }

  SignUpState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSignUpSuccessful
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isSignUpSuccessful: isSignUpSuccessful ?? this.isSignUpSuccessful
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage,isSignUpSuccessful];
}
