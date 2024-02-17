import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipes/data/data_source/auth/auth_datasource.dart';
import 'package:food_recipes/data/repository/authentication_repository/authenticate_repository.dart';


class AuthenticationRepositoryImpl implements AuthenticationRepository{

  final AuthDataSource _dataSource;

  AuthenticationRepositoryImpl(this._dataSource);

  @override
  Future<UserCredential> signUp(String email, String password) async {
    return await _dataSource.signUp(email, password);
  }

  @override
  Future<UserCredential> signIn(String email, String password) async {
    return await _dataSource.signIn(email, password);
  }

  @override
  Future<void> signOut() async {
    await _dataSource.signOut();
  }

  @override
  Future<UserCredential> getUser(AuthCredential credential) async {
    return await _dataSource.getUser(credential);
  }

  @override
  Future<void> updateUser(String name, String email, String image) async {
    await _dataSource.updateUser(name, email, image);
  }

  @override
  Future<void> forgotPassword(String email) async {
    await _dataSource.forgotPassword(email);
  }

  @override
  Future<void> deleteUser() async {
    await _dataSource.deleteUser();
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    return await _dataSource.signInWithGoogle();
  }
}