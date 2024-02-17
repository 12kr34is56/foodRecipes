
import 'package:food_recipes/data/repository/authentication_repository/authenticate_repository.dart';

class SignOutUseCase {
  final AuthenticationRepository _repository;

  SignOutUseCase(this._repository);

  Future<void> execute() {
    return _repository.signOut();
  }
}
