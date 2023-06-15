import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:lett/model/exception/exception_firebase.dart';
import 'package:lett/model/model_user.dart';
import 'package:lett/model/success/success_firebase.dart';

class SignUpBloc {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _successController = StreamController<FirebaseLettSuccess>();
  final _errorController = StreamController<FirebaseLettException>();

  Stream<FirebaseLettSuccess> get successStream => _successController.stream;
  Stream<FirebaseLettException> get errorStream => _errorController.stream;

  void dispose() {
    _successController.close();
    _errorController.close();
  }

  Future<void> signUpWithEmail(SignUpModel signUpModel) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: signUpModel.email,
        password: signUpModel.password,
      );
      _successController
          .add(FirebaseLettSuccess.showSuccessMessage('Sign up Successful'));
      // You can handle success scenarios here
    } on FirebaseAuthException catch (e) {
      _errorController.add(FirebaseLettException.fromAuthException(e));
    } catch (e) {
      _errorController.add(FirebaseLettException('Error: $e'));
    }
  }

  Future<void> loginWithEmail(SignUpModel signUpModel) async {
    try {
      // UserCredential userCredential =
      await _firebaseAuth.signInWithEmailAndPassword(
        email: signUpModel.email,
        password: signUpModel.password,
      );

      _successController
          .add(FirebaseLettSuccess.showSuccessMessage('Login Successful'));
      // You can handle success scenarios here
    } catch (e) {
      _errorController.add(FirebaseLettException('Error: $e'));
    }
  }
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      _successController.add(FirebaseLettSuccess.showSuccessMessage('Password reset email sent'));
      // You can handle success scenarios here
    } on FirebaseAuthException catch (e) {
      _errorController.add(FirebaseLettException.fromAuthException(e));
    } catch (e) {
      _errorController.add(FirebaseLettException('Error: $e'));
    }
  }
}
