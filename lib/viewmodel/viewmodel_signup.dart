import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:lett/model/model_user.dart';
import 'package:flutter/material.dart';
import 'package:lett/view/mixin/mixin_message.dart';
import 'package:lett/viewmodel/bloc/bloc_signup.dart';
import '../model/exception/exception_firebase.dart';
import '../model/success/success_firebase.dart';

//class SignUpViewModel with ChangeNotifier {
/*final SignUpBloc _signUpBloc = SignUpBloc();
  SignUpModel signUpModel = SignUpModel(email: '', password: '');

  Stream<FirebaseLettSuccess> get successStream => _signUpBloc.successStream;
  Stream<FirebaseLettException> get errorStream => _signUpBloc.errorStream;


  void dispose() {
    _signUpBloc.dispose();
  }

  Future<void> signUpWithEmail() async {
    await _signUpBloc.signUpWithEmail(signUpModel);

  }

  Future<void> loginWithEmail() async {
     await _signUpBloc.loginWithEmail(signUpModel);
  }*/

/*final SignUpBloc _signUpBloc = SignUpBloc();
  SignUpModel signUpModel = SignUpModel(email: '', password: '');

  String _errorMessage = '';
  String _successMessage = '';

  String get errorMessage => _errorMessage;
  String get successMessage => _successMessage;

  StreamSubscription<FirebaseLettException>? _errorSubscription;
  StreamSubscription<FirebaseLettSuccess>? _successSubscription;

  SignUpViewModel() {
    _errorSubscription = _signUpBloc.errorStream.listen((exception) {
      _errorMessage = exception.message;
      notifyListeners();
    });

    _successSubscription = _signUpBloc.successStream.listen((success) {
      _successMessage = success.message;
      notifyListeners();
    });
  }

  void dispose() {
    _signUpBloc.dispose();
    _errorSubscription?.cancel();
    _successSubscription?.cancel();
  }

  Future<void> signUpWithEmail() async {
    await _signUpBloc.signUpWithEmail(signUpModel);
  }

  Future<void> loginWithEmail() async {
    await _signUpBloc.loginWithEmail(signUpModel);
  }*/

class SignUpViewModel with ChangeNotifier, MessageMixin<SignUpViewModel> {
  final SignUpBloc _signUpBloc = SignUpBloc();
  SignUpModel signUpModel = SignUpModel(email: '', password: '');

  Stream<FirebaseLettSuccess> get successStream => _signUpBloc.successStream;
  Stream<FirebaseLettException> get errorStream => _signUpBloc.errorStream;

  StreamSubscription<FirebaseLettException>? _errorSubscription;
  StreamSubscription<FirebaseLettSuccess>? _successSubscription;

  SignUpViewModel() {
    _errorSubscription = errorStream.listen((exception) {
      setErrorMessage(exception.message);
    });

    _successSubscription = successStream.listen((success) {
      setSuccessMessage(success.message);
    });
  }

  void dispose() {
    _signUpBloc.dispose();
    _errorSubscription?.cancel();
    _successSubscription?.cancel();
  }

  Future<void> signUpWithEmail() async {
    setErrorMessage(''); // Clear previous error message
    setSuccessMessage(''); // Clear previous success message
    await _signUpBloc.signUpWithEmail(signUpModel);
  }

  Future<void> loginWithEmail() async {
    setErrorMessage(''); // Clear previous error message
    setSuccessMessage(''); // Clear previous success message
    await _signUpBloc.loginWithEmail(signUpModel);
  }

  Future<void> resetPassword(String email) async {
    setErrorMessage(''); // Clear previous error message
    setSuccessMessage(''); // Clear previous success message
    await _signUpBloc.resetPassword(email);
  }
}
