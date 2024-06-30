part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

// Loading States

final class SignUpLoading extends AuthState {}

final class SignInLoading extends AuthState {}

final class SignOutLoading extends AuthState {}

// Success States

final class SignInSuccess extends AuthState {
  final UserEntity user;

  const SignInSuccess(this.user);
}
final class SignUpSuccess extends AuthState {}
final class SignOutSuccess extends AuthState {}

// Failure States

final class SignInFailure extends AuthState {
  final String message;

  const SignInFailure(this.message);
}
final class SignUpFailure extends AuthState {
  final String message;

  const SignUpFailure(this.message);
}
final class SignOutFailure extends AuthState {
  final String message;

  const SignOutFailure(this.message);
}