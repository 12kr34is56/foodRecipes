
import 'package:food_recipes/data/repository/authentication_repository/authenticate_repository.dart';

class ForgotPasswordUseCase {
  final AuthenticationRepository _repository;

  ForgotPasswordUseCase(this._repository);

  Future<void> execute(String email) {
    return _repository.forgotPassword(email);
  }
}
