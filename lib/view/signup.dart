import 'package:flutter/material.dart';
import 'package:lett/view/mixin/mixin_text_form_field.dart';
import 'package:lett/viewmodel/viewmodel_signup.dart';
import 'package:provider/provider.dart';

import 'mixin/mixin_button.dart';

class SignUpPage extends StatelessWidget with ButtonMixin, TextFormFieldMixin {
  //const SignUpPage({super.key});
  final Key? key;

  const SignUpPage({Key? key}) : this.key = key;

  @override
  Widget build(BuildContext context) {
    final signUpViewModel = Provider.of<SignUpViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTextFormFieldMixin('Email', (value) {
              signUpViewModel.signUpModel.email = value;
            }),
            buildTextFormFieldMixin('Password', (value) {
              signUpViewModel.signUpModel.password = value;
            }),
            buildTextFormFieldMixin('Repeat Password', (value) {
              signUpViewModel.signUpModel.password = value;
            }),
            SizedBox(height: 16.0),
            buildElevatedButton('Sign Up', () {
              signUpViewModel.signUpWithEmail();
            }),
            buildTextButton('Reset Password', () {
                  Navigator.pushNamed(context, '/reset_password');
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
