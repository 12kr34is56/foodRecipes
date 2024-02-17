import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipes/data/repository/authentication_repository/authenticate_repository.dart';

class SignUpUseCase {
  final AuthenticationRepository _repository;

  SignUpUseCase(this._repository);

  Future<UserCredential> execute(String email, String password) {
    return _repository.signUp(email, password);
  }
}
