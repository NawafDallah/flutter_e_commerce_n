part of 'auth_bloc_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class InitialState extends AuthState {
  const InitialState();
}

////////////////  AUTH LOADING ////////////////

final class AuthSignUpLoadingState extends AuthState {
  const AuthSignUpLoadingState();
}

final class AuthLogInLoadingState extends AuthState {
  const AuthLogInLoadingState();
}

final class AuthForgetPassLoadingState extends AuthState {
  const AuthForgetPassLoadingState();
}

final class AuthResetPassLoadingState extends AuthState {
  const AuthResetPassLoadingState();
}

final class AuthVerifyCodeLoadingState extends AuthState {
  const AuthVerifyCodeLoadingState();
}

////////////////  AUTH SUCCESS ////////////////

final class AuthSignUpSuccessState extends AuthState {
  const AuthSignUpSuccessState();
}

final class AuthLogInSuccessState extends AuthState {
  final UserEntity user;
  const AuthLogInSuccessState({required this.user});

  @override
  List<Object> get props => [user];
}

final class AuthVerifyCodeSuccessState extends AuthState {
  const AuthVerifyCodeSuccessState();
}

final class AuthResendCodeSuccessState extends AuthState {
  const AuthResendCodeSuccessState();
}

final class AuthForgetPassSuccessState extends AuthState {
  const AuthForgetPassSuccessState();
}

final class AuthResetPassSuccessState extends AuthState {
  const AuthResetPassSuccessState();
}

////////////////  AUTH FAILURE ////////////////

final class AuthSignUpFailureState extends AuthState {
  final String error;
  const AuthSignUpFailureState({required this.error});

  @override
  List<Object> get props => [error];
}

final class AuthLogInFailureState extends AuthState {
  final String error;
  const AuthLogInFailureState({required this.error});

  @override
  List<Object> get props => [error];
}

final class AuthVerifyCodeFailureState extends AuthState {
  final String error;
  const AuthVerifyCodeFailureState({required this.error});

  @override
  List<Object> get props => [error];
}

final class AuthResendCodeFailureState extends AuthState {
  final String error;
  const AuthResendCodeFailureState({required this.error});

  @override
  List<Object> get props => [error];
}

final class AuthForgetPassFailureState extends AuthState {
  final String error;
  const AuthForgetPassFailureState({required this.error});

  @override
  List<Object> get props => [error];
}

final class AuthResetPassFailureState extends AuthState {
  final String error;
  const AuthResetPassFailureState({required this.error});

  @override
  List<Object> get props => [error];
}
