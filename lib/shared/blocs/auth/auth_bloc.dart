import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lett/shared/blocs/auth/auth_state.dart';
import 'package:lett/shared/blocs/event/auth_event.dart';
import 'package:lett/shared/models/sign_up_data.dart';
import 'package:lett/shared/repositories/services/firebase_auth_service.dart';



class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthService authService;

  AuthBloc(this.authService) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is SignUp) {
      yield* _mapSignUpToState(event.signUpData);
    } else if (event is SignIn) {
      yield* _mapSignInToState(event.email, event.password);
    } else if (event is SignOut) {
      yield* _mapSignOutToState();
    } else if (event is ResetPassword) {
      yield* _mapResetPasswordToState(event.email);
    }
  }

  Stream<AuthState> _mapAppStartedToState() async* {
    yield AuthLoading();
    final User? user = authService.getCurrentUser();
    if (user != null) {
      yield AuthAuthenticated(user);
    } else {
      yield AuthUnauthenticated();
    }
  }

  Stream<AuthState> _mapSignUpToState(SignUpData signUpData) async* {
    yield AuthLoading();
    final User? user = await authService.signUp(
      signUpData.email,
      signUpData.password,
    );
    if (user != null) {
      yield AuthAuthenticated(user);
    } else {
      yield AuthUnauthenticated();
    }
  }

  Stream<AuthState> _mapSignInToState(String email, String password) async* {
    yield AuthLoading();
    final User? user = await authService.signIn(email, password);
    if (user != null) {
      yield AuthAuthenticated(user);
    } else {
      yield AuthUnauthenticated();
    }
  }

  Stream<AuthState> _mapSignOutToState() async* {
    yield AuthLoading();
    await authService.signOut();
    yield AuthUnauthenticated();
  }

  Stream<AuthState> _mapResetPasswordToState(String email) async* {
    yield AuthLoading();
    await authService.resetPassword(email);
    yield AuthUnauthenticated();
  }
}
