import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipes/core/exceptions/authentications_exceptions/authentications_exception.dart';

import 'package:google_sign_in/google_sign_in.dart';

class LoginAuth {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static final User? user = FirebaseAuth.instance.currentUser;

  //sign up
  static Future<UserCredential> signUp({String email = "", String password = ""}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPasswordException();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseException();
      }
    } catch (e) {
      throw SignUpException();
    }
    throw SignUpException();
  }

  //sign in
  static Future<UserCredential> signIn({required String email,required String password}) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AccountNotFoundException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordException();
      }
    }
    throw SignInException();
  }

  //sign out
  static Future<void> signOut() async {
    await auth.signOut().then((value) => GoogleSignIn().signOut());
  }

  //get user
  static Future<UserCredential> getUser(AuthCredential credential) async {
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final user = userCredential.user;
    print(user?.uid);
    return userCredential;
  }

  //update User
  static Future<void> updateUser(
  {String name = "", String email = "", String image = ""}) async {
    try {
      await user!.updateDisplayName(name);
      await user!.updateEmail(email);
      await user!.updatePhotoURL(image);
    } on AuthenticationException catch (e) {
      throw UpdateUserException();
    }
  }

  //password reset
  static Future<void> forgotPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AccountNotFoundException();
      }
    }
  }

  //delete user
  static Future<void> deleteUser() async {
    try {
      await user!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        throw SignInException();
      }
    }
  }

  //google sign in
  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
