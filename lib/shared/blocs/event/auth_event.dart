import 'package:lett/shared/models/sign_up_data.dart';

abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class SignUp extends AuthEvent {
  final SignUpData signUpData;

  SignUp(this.signUpData);
}

class SignIn extends AuthEvent {
  final String email;
  final String password;

  SignIn(this.email, this.password);
}

class SignOut extends AuthEvent {}

class ResetPassword extends AuthEvent {
  final String email;

  ResetPassword(this.email);
}
