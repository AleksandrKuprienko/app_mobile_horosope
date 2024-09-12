part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();

  @override
  List<Object> get props => [];
}

class AuthListenerEvent extends AuthEvent {
  const AuthListenerEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  const LoginEvent({required this.email, required this.password});
  final String email;
  final String password;

  @override
  List<Object> get props => [];
}

class RegistrationEvent extends AuthEvent {
  const RegistrationEvent({required this.email, required this.password});
  final String email;
  final String password;

  @override
  List<Object> get props => [];
}

class ForgotPasswordEvent extends AuthEvent {
  const ForgotPasswordEvent({required this.email});
  final String email;

  @override
  List<Object> get props => [];
}
