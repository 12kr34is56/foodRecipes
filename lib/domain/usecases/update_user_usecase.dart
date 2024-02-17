
import 'package:food_recipes/data/repository/authentication_repository/authenticate_repository.dart';

class UpdateUserUseCase {
  final AuthenticationRepository _repository;

  UpdateUserUseCase(this._repository);

  Future<void> execute(String name, String email, String image) {
    return _repository.updateUser(name, email, image);
  }
}
