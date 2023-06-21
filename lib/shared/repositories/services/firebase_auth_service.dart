import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth
   = FirebaseAuth.instance;

  Future<User?> signUp(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      debugPrint('Error during sign up: $e');
      return null;
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      debugPrint('Error during sign in: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      debugPrint('Error during sign out: $e');
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      debugPrint('Error during password reset: $e');
    }
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
