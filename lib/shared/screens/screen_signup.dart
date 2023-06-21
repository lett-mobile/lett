import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lett/shared/blocs/auth/auth_bloc.dart';
import 'package:lett/shared/blocs/auth/auth_state.dart';
import 'package:lett/shared/blocs/event/auth_event.dart';
import 'package:lett/shared/models/sign_up_data.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            // Handle successful sign up
          } else if (state is AuthUnauthenticated) {
            // Handle failed sign up
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      final signUpData = SignUpData(email, password);
                      BlocProvider.of<AuthBloc>(context)
                          .add(SignUp(signUpData));
                    },
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
