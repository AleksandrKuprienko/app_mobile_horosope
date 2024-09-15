import 'package:app_mobile_horosope/notifications/app_notifications.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth firebaseAuth;

  AuthBloc({required this.firebaseAuth}) : super(AuthenticationLoadingState()) {
    on<LoginEvent>((event, emit) => _login(emit: emit, event: event));
    on<LogoutEvent>((event, emit) => _logOut(emit: emit, event: event));
    on<RegistrationEvent>((event, emit) => _registration(emit: emit, event: event));
    on<ForgotPasswordEvent>((event, emit) => _forgotPassword(emit: emit, event: event));
    on<AuthListenerEvent>((event, emit) async {
      await emit.forEach(firebaseAuth.authStateChanges(), onData: (User? user) {
        return user != null ? AuthenticationSuccessState() : AuthenticationFailureState();
      });
    });
  }

  void _login({required LoginEvent event, required Emitter<AuthState> emit}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: event.email, password: event.password);
      emit(AuthenticationSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(AuthenticationFailureState());
      AppNotifications.errorSnackBar(e.message ?? 'Error');
    } catch (e) {
      emit(AuthenticationFailureState());
      AppNotifications.errorSnackBar('Error please try again');
    }
  }

  void _logOut({required LogoutEvent event, required Emitter<AuthState> emit}) async {
    try {
      await firebaseAuth.signOut();
      emit(AuthenticationFailureState());
    } catch (e) {
      AppNotifications.errorSnackBar(e.toString());
      emit(AuthenticationFailureState());
    }
  }

  void _registration({required RegistrationEvent event, required Emitter<AuthState> emit}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: event.email, password: event.password);
      emit(AuthenticationSuccessState());
    } catch (e) {
      AppNotifications.errorSnackBar(e.toString());
      emit(AuthenticationFailureState());
    }
  }

  void _forgotPassword({required ForgotPasswordEvent event, required Emitter<AuthState> emit}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: event.email);
      emit(AuthenticationFailureState());
      AppNotifications.successSnackBar('Email with instructions has been sent.');
    } on FirebaseAuthException catch (e) {
      AppNotifications.errorSnackBar(e.message ?? 'Error');
      emit(AuthenticationFailureState());
    } catch (e) {
      AppNotifications.errorSnackBar(e.toString());
      emit(AuthenticationFailureState());
    }
  }
}
