
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipes/data/repository/authentication_repository/authenticate_repository.dart';

class SignInWithGoogleUseCase {
  final AuthenticationRepository _repository;

  SignInWithGoogleUseCase(this._repository);

  Future<UserCredential> execute() {
    return _repository.signInWithGoogle();
  }
}
