import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {

  Future<UserCredential> signUp(String email, String password);
  Future<UserCredential> signIn(String email, String password);
  Future<void> signOut();
  Future<UserCredential> getUser(AuthCredential credential);
  Future<void> updateUser(String name, String email, String image);
  Future<void> forgotPassword(String email);
  Future<void> deleteUser();
  Future<UserCredential> signInWithGoogle();

}
