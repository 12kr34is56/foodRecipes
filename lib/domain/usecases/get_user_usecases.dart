
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipes/data/repository/authentication_repository/authenticate_repository.dart';

class GetUserUseCase {
  final AuthenticationRepository _repository;

  GetUserUseCase(this._repository);

  Future<UserCredential> execute(AuthCredential credential) {
    return _repository.getUser(credential);
  }
}
