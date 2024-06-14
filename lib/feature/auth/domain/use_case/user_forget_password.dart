import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../repository/auth_repository.dart';

class ForgetPasswordCase implements UseCase<void, String> {
  final AuthRepository _authRepository;

  ForgetPasswordCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, void>> call({String? params}) async {
    return await _authRepository.forgetPassword(email: params!);
  }
}
