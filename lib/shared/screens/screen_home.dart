import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lett/shared/blocs/auth/auth_bloc.dart';
import 'package:lett/shared/blocs/auth/auth_state.dart';
import 'package:lett/shared/blocs/event/auth_event.dart';
import 'package:lett/shared/screens/screen_login.dart';
import 'package:lett/shared/screens/screen_reset_password.dart';
import 'package:lett/shared/screens/screen_signup.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AuthAuthenticated) {
            return Center(
              child: Text('Welcome, ${state.user.email}'),
            );
          } else {
            return Center(
              child: Text('Not authenticated'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _authBloc.add(SignOut());
        },
        child: Icon(Icons.logout),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
                child: Text('Sign Up'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
                  );
                },
                child: Text('Reset Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
