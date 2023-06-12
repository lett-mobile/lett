import 'package:lett/model/success/success_base.dart';

class FirebaseLettSuccess extends Success {

 FirebaseLettSuccess(String message) : super(message);

  /*@override
  String toString() {
    return '$message (Status Code: $statusCode)';
  }*/
  factory FirebaseLettSuccess.showSuccessMessage(String message) {
    return FirebaseLettSuccess(message);
  }
}
