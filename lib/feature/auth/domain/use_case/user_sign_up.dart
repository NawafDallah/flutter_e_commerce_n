import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../repository/auth_repository.dart';

class UserSignUpCase implements UseCase<void, SignUpParams> {
  final AuthRepository _authRepository;

  UserSignUpCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, void>> call({SignUpParams? params}) async {
    return await _authRepository.signUp(
      name: params!.name,
      email: params.email,
      password: params.password,
      phone: params.phone,
    );
  }
}

class SignUpParams {
  final String name;
  final String email;
  final String password;
  final int phone;

  const SignUpParams({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });
}
