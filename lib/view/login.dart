import 'package:flutter/material.dart';
import 'package:lett/view/mixin/mixin_button.dart';
import 'package:lett/view/mixin/mixin_text_form_field.dart';
import 'package:lett/viewmodel/viewmodel_signup.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget with ButtonMixin, TextFormFieldMixin {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpViewModel = Provider.of<SignUpViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTextFormFieldMixin('Email', (value) {}),
            buildTextFormFieldMixin('Password', (value) {}),
            SizedBox(height: 16.0),
            buildElevatedButton('Login', () {}),
            buildTextButton('Sign Up', () {
              // Handle signup logic
              Navigator.pushNamed(context, '/signup');
            }),
            buildTextButton('Reset Password', () {
               Navigator.pushNamed(context, '/reset_password');
            }),
          ],
        ),
      ),
    );
  }
}
