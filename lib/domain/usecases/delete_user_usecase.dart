
import 'package:food_recipes/data/repository/authentication_repository/authenticate_repository.dart';

class DeleteUserUseCase {
  final AuthenticationRepository _repository;

  DeleteUserUseCase(this._repository);

  Future<void> execute() {
    return _repository.deleteUser();
  }
}
