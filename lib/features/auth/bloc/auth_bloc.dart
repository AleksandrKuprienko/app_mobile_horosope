import 'dart:developer';

import 'package:app_mobile_horosope/notifications/app_notifications.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth firebaseAuth;
  User? _currentUser;

  User? get getUser => _currentUser;

  AuthBloc({required this.firebaseAuth}) : super(AuthenticationLoadingState()) {
    on<LoginEvent>((event, emit) => _login(emit: emit, event: event));
    on<LogoutEvent>((event, emit) => _logOut(emit: emit, event: event));
    on<RegistrationEvent>((event, emit) => _registration(emit: emit, event: event));
    on<AutoLogin>((event, emit) => emit(AuthenticationSuccessState()));

    firebaseAuth.authStateChanges().listen(
      (firebaseUser) async {
        log(firebaseUser.toString());
        _currentUser = firebaseUser;
        if (_currentUser != null) {
          emit(AuthenticationSuccessState());
        } else if (_currentUser == null) {
          emit(AuthenticationFailureState());
        }
      },
    );
  }

  void _login({required LoginEvent event, required Emitter<AuthState> emit}) {
    try {
      firebaseAuth.signInWithEmailAndPassword(email: event.email, password: event.password);
      emit(AuthenticationSuccessState());
    } on Object catch (e) {
      emit(AuthenticationFailureState());
      AppNotifications.errorSnackBar(e.toString());
    }
  }

  void _logOut({required LogoutEvent event, required Emitter<AuthState> emit}) {
    try {
      firebaseAuth.signOut();
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
}
