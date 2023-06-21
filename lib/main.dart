import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lett/shared/blocs/auth/auth_bloc.dart';
import 'package:lett/shared/screens/screen_home.dart';
import 'package:lett/shared/utils/utils_mixins/mixin_button.dart';
import 'package:lett/shared/utils/theme/theme_lett.dart';
import 'package:provider/provider.dart';
import 'package:universal_io/io.dart';
import 'shared/repositories/services/firebase_auth_service.dart';

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
  final authService = FirebaseAuthService();
  final authBloc = AuthBloc(authService);

  runApp(MyApp(authBloc));
  //runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthBloc authBloc;

  MyApp(this.authBloc);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>.value(
      value: authBloc,
      child: MaterialApp(
        title: 'Your App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
