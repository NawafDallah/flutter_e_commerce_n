part of 'auth_bloc_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final int phone;
  const SignUpEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  @override
  List<Object> get props => [name, email, password, phone];
}

final class VerifyCodeEvent extends AuthEvent {
  final String verificationCode;
  final String email;
  const VerifyCodeEvent({
    required this.verificationCode,
    required this.email,
  });

  @override
  List<Object> get props => [verificationCode];
}

final class ResendVerifyCodeEvent extends AuthEvent {
  final String email;
  const ResendVerifyCodeEvent({required this.email});

  @override
  List<Object> get props => [email];
}

final class ForgetPasswordEvent extends AuthEvent {
  final String email;
  const ForgetPasswordEvent({required this.email});

  @override
  List<Object> get props => [email];
}

final class ResetPasswordEvent extends AuthEvent {
  final String email;
  final String password;
  final String confirmPassword;
  const ResetPasswordEvent({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [email, password, confirmPassword];
}

final class LogInEvent extends AuthEvent {
  final String email;
  final String password;
  const LogInEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
