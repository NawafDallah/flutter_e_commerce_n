import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entity/user.dart';

abstract interface class AuthRepository {
  // NEW ACCOUNT REGISTRATION
  Future<Either<Failure, void>> signUp({
    required String name,
    required String email,
    required String password,
    required int phone,
  });
  // LOG IN
  Future<Either<Failure, UserEntity>> logIn({
    required String email,
    required String password,
  });
  // SEND THE VERIFICATION CODE TO THE USER EMAIL AND VERIFY EMAIL
  Future<Either<Failure, void>> verifyCode({
    required String verificationCode,
    required String email,
  });
  // SEND THE USER EMAIL TO DATABASE
  Future<Either<Failure, void>> forgetPassword({required String email});
  // RESEND THE VERIFICATION CODE TO THE USER EMAIL
  Future<Either<Failure, void>> resendVerificationCode({required String email});
  // RESET THE USER PASSWORD AND SEVE IT
  Future<Either<Failure, void>> resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
  });
}
