import 'package:flutter/material.dart';
import 'package:lett/view/mixin/mixin_button.dart';
import 'package:lett/view/mixin/mixin_snackbar.dart';
import 'package:lett/view/mixin/mixin_text.dart';
import 'package:lett/view/mixin/mixin_text_form_field.dart';
import 'package:lett/view/widget/widget_error.dart';
import 'package:lett/viewmodel/viewmodel_signup.dart';
import 'package:provider/provider.dart';

/*class LoginPage extends StatelessWidget with ButtonMixin, TextFormFieldMixin {
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
            buildTextFormFieldMixin('Email', (value) {
              signUpViewModel.signUpModel.email = value.trim();
              print(value);
            }),
            buildTextFormFieldMixin('Password', (value) {
              signUpViewModel.signUpModel.password = value.trim();
              print(value);
            }),
            SizedBox(height: 16.0),
            buildElevatedButton('Login', () {
              signUpViewModel.loginWithEmail();
            }),
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
}*/
class LoginPage extends StatelessWidget
    with ButtonMixin, TextFormFieldMixin, TextMixin, SnackbarMixin {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Consumer<SignUpViewModel>(
          builder: (context, signUpViewModel, _) {
            final errorMessage = signUpViewModel.errorMessage;
            final successMessage = signUpViewModel.successMessage;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTextFormFieldMixin('Email', (value) {
                  signUpViewModel.signUpModel.email = value.trim();
                }),
                buildTextFormFieldMixin('Password', (value) {
                  signUpViewModel.signUpModel.password = value.trim();
                }),
                SizedBox(height: 16.0),
                ErrorTextWidget(errorMessage: errorMessage),
                buildElevatedButton('Login', signUpViewModel.loginWithEmail),
                buildTextButton('Sign Up', () {
                  // Handle signup logic
                  Navigator.pushNamed(context, '/signup');
                }),
                buildTextButton('Reset Password', () {
                  Navigator.pushNamed(context, '/reset_password');
                }),
              ],
            );
          },
        ),
      ),
    );
  }

  //
}
