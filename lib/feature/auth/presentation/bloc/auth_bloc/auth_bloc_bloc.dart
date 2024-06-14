import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entity/user.dart';
import '../../../domain/use_case/user_forget_password.dart';
import '../../../domain/use_case/user_log_in.dart';
import '../../../domain/use_case/user_resend_verify_code.dart';
import '../../../domain/use_case/user_reset_password.dart';
import '../../../domain/use_case/user_sign_up.dart';
import '../../../domain/use_case/user_verify_code.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUpCase _userSignUpCase;
  final UserVerifyCodeCase _userVerifyCodeCase;
  final ResendVerifyCodeCase _resendVerifyCodeCase;
  final ForgetPasswordCase _forgetPasswordCase;
  final ResetPasswordCase _resetPasswordCase;
  final UserLogInCase _userLogInCase;
  AuthBloc(
      {required UserSignUpCase userSignUpCase,
      required UserVerifyCodeCase userVerifyCodeCase,
      required ResendVerifyCodeCase resendVerifyCodeCase,
      required ForgetPasswordCase forgetPasswordCase,
      required ResetPasswordCase resetPasswordCase,
      required UserLogInCase userLogInCase})
      : _userSignUpCase = userSignUpCase,
        _userVerifyCodeCase = userVerifyCodeCase,
        _resendVerifyCodeCase = resendVerifyCodeCase,
        _forgetPasswordCase = forgetPasswordCase,
        _resetPasswordCase = resetPasswordCase,
        _userLogInCase = userLogInCase,
        super(const InitialState()) {
    on<SignUpEvent>(_signUp);
    on<VerifyCodeEvent>(_verifyCode);
    on<ResendVerifyCodeEvent>(_resendVerifyCode);
    on<ForgetPasswordEvent>(_forgetPassword);
    on<ResetPasswordEvent>(_resetPassword);
    on<LogInEvent>(_logIn);
  }

  void _logIn(
    LogInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLogInLoadingState());
    final response = await _userLogInCase(
      params: LogInParams(
        email: event.email,
        password: event.password,
      ),
    );

    response.fold(
      (failure) => emit(AuthLogInFailureState(error: failure.message!)),
      (user) => emit(AuthLogInSuccessState(user: user)),
    );
  }

  void _resetPassword(
    ResetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthResetPassLoadingState());
    final response = await _resetPasswordCase(
        params: ResetPasswordParams(
      email: event.email,
      password: event.password,
      confirmPassword: event.confirmPassword,
    ));

    response.fold(
        (failure) => emit(AuthResetPassFailureState(error: failure.message!)),
        (_) => emit(const AuthResetPassSuccessState()));
  }

  void _forgetPassword(
    ForgetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthForgetPassLoadingState());
    final response = await _forgetPasswordCase(params: event.email);

    response.fold(
        (failure) => emit(AuthForgetPassFailureState(error: failure.message!)),
        (_) => emit(const AuthForgetPassSuccessState()));
  }

  void _resendVerifyCode(
    ResendVerifyCodeEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthVerifyCodeLoadingState());
    final response = await _resendVerifyCodeCase(params: event.email);

    response.fold(
        (failure) => emit(AuthResendCodeFailureState(error: failure.message!)),
        (_) => emit(const AuthResendCodeSuccessState()));
  }

  void _verifyCode(
    VerifyCodeEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthVerifyCodeLoadingState());
    final response = await _userVerifyCodeCase(
        params: VerifyCodeParams(
      email: event.email,
      verificatioCode: event.verificationCode,
    ));

    response.fold(
        (failure) => emit(AuthVerifyCodeFailureState(error: failure.message!)),
        (_) => emit(const AuthVerifyCodeSuccessState()));
  }

  void _signUp(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthSignUpLoadingState());
    final response = await _userSignUpCase(
        params: SignUpParams(
      email: event.email,
      name: event.name,
      password: event.password,
      phone: event.phone,
    ));

    response.fold(
        (failure) => emit(AuthSignUpFailureState(error: failure.message!)),
        (_) => emit(const AuthSignUpSuccessState()));
  }
}
