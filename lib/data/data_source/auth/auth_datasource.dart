import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipes/core/exceptions/authentications_exceptions/authentications_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthDataSource {
   FirebaseAuth auth = FirebaseAuth.instance;
   final User? user = FirebaseAuth.instance.currentUser;

  //sign up
   Future<UserCredential> signUp(String email, String password) async {
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
   Future<UserCredential> signIn(String email, String password) async {
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
   Future<void> signOut() async {
    await auth.signOut().then((value) => GoogleSignIn().signOut());
  }

  //get user
   Future<UserCredential> getUser(AuthCredential credential) async {
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final user = userCredential.user;
    print(user?.uid);
    return userCredential;
  }

  //update User
   Future<void> updateUser(
      String name, String email, String image) async {
    try {
      await user!.updateDisplayName(name);
      await user!.updateEmail(email);
      await user!.updatePhotoURL(image);
    } on AuthenticationException catch (e) {
      throw UpdateUserException();
    }
  }

  //password reset
   Future<void> forgotPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AccountNotFoundException();
      }
    }
  }

  //delete user
   Future<void> deleteUser() async {
    try {
      await user!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        throw SignInException();
      }
    }
  }

  //google sign in
   Future<UserCredential> signInWithGoogle() async {
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
