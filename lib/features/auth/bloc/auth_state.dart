part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthenticationSuccessState extends AuthState {}

final class AuthenticationFailureState extends AuthState {}

final class AuthenticationLoadingState extends AuthState {}
