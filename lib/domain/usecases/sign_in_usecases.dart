
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipes/data/repository/authentication_repository/authenticate_repository.dart';

class SignInUseCase {
  final AuthenticationRepository _repository;

  SignInUseCase(this._repository);

  Future<UserCredential> execute(String email, String password) {
    return _repository.signIn(email, password);
  }
}
