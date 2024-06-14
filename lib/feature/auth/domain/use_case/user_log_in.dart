import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entity/user.dart';
import '../repository/auth_repository.dart';

class UserLogInCase implements UseCase<UserEntity, LogInParams> {
  final AuthRepository _authRepository;

  UserLogInCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, UserEntity>> call({LogInParams? params}) async {
    return await _authRepository.logIn(
      email: params!.email,
      password: params.password,
    );
  }
}

class LogInParams {
  final String email;
  final String password;

  const LogInParams({
    required this.email,
    required this.password,
  });
}
