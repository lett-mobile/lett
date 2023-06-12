import 'package:flutter/foundation.dart';
import 'package:lett/model/model_user.dart';
import 'package:flutter/material.dart';
import 'package:lett/viewmodel/bloc/bloc_signup.dart';
import '../model/exception/exception_firebase.dart';
import '../model/success/success_firebase.dart';

class SignUpViewModel with ChangeNotifier {
  final SignUpBloc _signUpBloc = SignUpBloc();
  SignUpModel signUpModel = SignUpModel(email: '', password: '');

  Stream<FirebaseLettSuccess> get successStream => _signUpBloc.successStream;
  Stream<FirebaseLettException> get errorStream => _signUpBloc.errorStream;

  void dispose() {
    _signUpBloc.dispose();
  }

  Future<void> signUpWithEmail() async {
    await _signUpBloc.signUpWithEmail(signUpModel);
  }
}
