class AuthenticationException implements Exception {
  final String message;

  AuthenticationException(this.message);

  @override
  String toString() {
    return 'AuthenticationException: $message';
  }
}

class WeakPasswordException extends AuthenticationException {
  WeakPasswordException() : super('The password provided is too weak.');
}

class WrongPasswordException extends AuthenticationException {
  WrongPasswordException() : super('The password provided is wrong.');
}

class EmailAlreadyInUseException extends AuthenticationException {
  EmailAlreadyInUseException() : super('The account already exists for that email.');
}

class AccountNotFoundException extends AuthenticationException {
  AccountNotFoundException() : super('The account does not exist.');
}

class SignUpException extends AuthenticationException {
  SignUpException() : super('Error in creating in Account');
}

class SignInException extends AuthenticationException {
  SignInException() : super('Error in sign in Account');
}
class UpdateUserException extends AuthenticationException {
  UpdateUserException() : super('Error in Updating Account');
}
