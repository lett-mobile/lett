import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lett/view/login.dart';
import 'package:lett/view/mixin/mixin_button.dart';
import 'package:lett/view/reset_password.dart';
import 'package:lett/view/signup.dart';
import 'package:lett/view/theme/theme_lett.dart';
import 'package:lett/viewmodel/viewmodel_signup.dart';
import 'package:provider/provider.dart';
import 'package:universal_io/io.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // Custom FirebaseOptions
    FirebaseOptions firebaseOptions = FirebaseOptions(
        apiKey: "AIzaSyDHjnPwfJCT3c-qZ4QsrzZsep-3BoqKXc0",
        authDomain: "lett-40fda.firebaseapp.com",
        projectId: "lett-40fda",
        storageBucket: "lett-40fda.appspot.com",
        messagingSenderId: "812232727543",
        appId: "1:812232727543:web:200dbdf22516ab1529acf2");

    await Firebase.initializeApp(
      options: firebaseOptions,
    );
  }
  if (Platform.isAndroid || Platform.isIOS) {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*return MaterialApp(
      title: 'Email Login Demo',
      theme: LettTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/second': (context) => SecondPage(),
      },
      // home: SignupPage(),
    );*/

    return ChangeNotifierProvider(
      create: (_) => SignUpViewModel(),
      child: MaterialApp(
        title: 'Email Login Demo',
        theme: LettTheme.lightTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginPage(),
          '/signup': (context) => const SignUpPage(),
          '/reset_password': (context) => const ResetPasswordPage(),
        },
      ),
    );
  }
}

/*class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();

      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // User successfully registered
        User? user = userCredential.user;
        print('User registered: ${user?.email}');

        // Navigate to another screen or perform additional actions
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Please enter email and password.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print('Signup failed: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Signup failed. Please try again.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Sign Up'),
              onPressed: _signUp,
            ),
            ElevatedButton(
              child: Text('Next Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }*/

