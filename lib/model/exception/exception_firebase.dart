import 'package:firebase_auth/firebase_auth.dart';
import 'package:lett/model/exception/exception_base.dart';

class FirebaseLettException extends AppException {
  FirebaseLettException(String message) : super(message);

  factory FirebaseLettException.fromAuthException(
      FirebaseAuthException exception) {
    final errorMessages = {
      'weak-password': 'The password provided is too weak.',
      'email-already-in-use': 'The account already exists for that email.',
      // Add more entries as needed for specific Firebase exception codes
    };

    final errorMessage =
        errorMessages[exception.code] ?? 'An unknown error occurred.';
    return FirebaseLettException(errorMessage);
  }
}
