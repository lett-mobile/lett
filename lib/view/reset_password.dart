import 'package:flutter/material.dart';
import 'package:lett/view/mixin/mixin_text_form_field.dart';
import 'package:lett/view/widget/widget_error.dart';
import 'package:lett/viewmodel/viewmodel_signup.dart';
import 'package:provider/provider.dart';
import 'mixin/mixin_button.dart';

class ResetPasswordPage extends StatelessWidget
    with ButtonMixin, TextFormFieldMixin {
  //const SignUpPage({super.key});
  final Key? key;

  const ResetPasswordPage({Key? key}) : this.key = key;

  @override
  Widget build(BuildContext context) {
    final signUpViewModel = Provider.of<SignUpViewModel>(context);
     final errorMessage = signUpViewModel.errorMessage;
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTextFormFieldMixin('Email', (value) {
              signUpViewModel.signUpModel.email = value;
            }),
            SizedBox(height: 16.0),
            ErrorTextWidget(errorMessage: errorMessage),
            buildElevatedButton('Reset Password', () {
              String email = signUpViewModel.signUpModel.email;
              signUpViewModel.resetPassword(email);
            }),
            buildTextButton('Sign Up', () {
              Navigator.pushNamed(context, '/signup');
            }),
            buildTextButton('Back to Login', () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            }),
          ],
        ),
      ),
    );
  }
}
