import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../repository/auth_repository.dart';

class UserVerifyCodeCase implements UseCase<void, VerifyCodeParams> {
  final AuthRepository _authRepository;

  UserVerifyCodeCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, void>> call({VerifyCodeParams? params}) async {
    return await _authRepository.verifyCode(
      verificationCode: params!.verificatioCode,
      email: params.email,
    );
  }
}

class VerifyCodeParams {
  final String email;
  final String verificatioCode;

  const VerifyCodeParams({
    required this.email,
    required this.verificatioCode,
  });
}
