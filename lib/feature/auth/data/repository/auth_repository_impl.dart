import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repository/auth_repository.dart';
import '../date_sources/user_service.dart';
import '../model/user.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImp({required AuthService authService})
      : _authService = authService;

  @override
  Future<Either<Failure, void>> signUp({
    required String name,
    required String email,
    required String password,
    required int phone,
  }) async {
    try {
      final response = await _authService.signUp(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> verifyCode({
    required String verificationCode,
    required String email,
  }) async {
    try {
      final response = await _authService.verifyCode(
        verificationCode: verificationCode,
        email: email,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure(message: e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> resendVerificationCode(
      {required String email}) async {
    try {
      final response = await _authService.resendVerifyCode(email: email);
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure(message: e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> forgetPassword({required String email}) async {
    try {
      final response = await _authService.forgetPassword(email: email);
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure(message: e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await _authService.resetPassword(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure(message: e.message!));
    }
  }

  @override
  Future<Either<Failure, UserModel>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _authService.logIn(
        email: email,
        password: password,
      );
      return Right(user);
    } on DioException catch (e) {
      return Left(Failure(message: e.message!));
    }
  }
}
