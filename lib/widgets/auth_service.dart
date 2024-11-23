import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Sign in with email and password
  Future<UserCredential> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle different error codes
      switch (e.code) {
        case 'user-not-found':
          throw Exception('No user found for that email.');
        case 'wrong-password':
          throw Exception('Incorrect password provided.');
        case 'invalid-email':
          throw Exception('The email address is not valid.');
        default:
          throw Exception('An error occurred: ${e.message}');
      }
    }
  }

  // Register a new user with email and password
  Future<UserCredential> signUpWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle errors
      switch (e.code) {
        case 'email-already-in-use':
          throw Exception('The email address is already in use.');
        case 'invalid-email':
          throw Exception('The email address is invalid.');
        default:
          throw Exception('An error occurred: ${e.message}');
      }
    }
  }

  // Sign out the current user
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      throw Exception('An error occurred while signing out: ${e.toString()}');
    }
  }

  // Check if the user is already logged in
  User? getCurrentUser() {
    return auth.currentUser;
  }

  // Optional: Send a password reset email
  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception('Failed to send password reset email: ${e.message}');
    }
  }
}
