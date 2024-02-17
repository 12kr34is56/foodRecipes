part of 'sign_in_bloc.dart';

enum SignInStatus { initial, loading, success, failure }

@immutable
class SignInState extends Equatable{

  final SignInStatus status;
  final String failure;

  const SignInState({this.status = SignInStatus.initial, this.failure = ''});

  SignInState copyWith({SignInStatus? status, String? failure}) {
    return SignInState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object> get props => [status, failure];

}

