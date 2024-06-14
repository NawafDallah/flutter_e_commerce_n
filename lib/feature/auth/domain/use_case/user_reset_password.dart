import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../repository/auth_repository.dart';

class ResetPasswordCase implements UseCase<void, ResetPasswordParams> {
  final AuthRepository _authRepository;

  ResetPasswordCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, void>> call({ResetPasswordParams? params}) async {
    return await _authRepository.resetPassword(
      email: params!.email,
      password: params.password,
      confirmPassword: params.confirmPassword,
    );
  }
}

class ResetPasswordParams {
  final String email;
  final String password;
  final String confirmPassword;

  const ResetPasswordParams({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}
