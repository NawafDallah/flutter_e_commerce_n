import 'package:dio/dio.dart';

import '../../../../common/utils/constants/api_secret.dart';
import '../../../../common/utils/constants/app_api.dart';
import '../../../../core/error/error_handler/auth_exceptions.dart';
import '../model/user.dart';

abstract interface class AuthService {
  Future<void> resendVerifyCode({required String email});
  Future<void> forgetPassword({required String email});
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required int phone,
  });
  Future<void> verifyCode({
    required String verificationCode,
    required String email,
  });
  Future<void> resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
  });
  Future<UserModel> logIn({
    required String email,
    required String password,
  });
}

class AuthServiceImp implements AuthService {
  const AuthServiceImp({required this.dio});

  final Dio dio;

  @override
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required int phone,
  }) async {
    try {
      // dio request
      await dio.post(
        AppApi.signUp,
        data: FormData.fromMap({
          "userName": name,
          "userEmail": email,
          "userPassword": password,
          "userPhone": phone,
        }),
        options: Options(headers: myheaders),
      );
    } on DioException catch (e) {
      AuthException.signUpException(e);
    }
  }

  @override
  Future<void> verifyCode({
    required String verificationCode,
    required String email,
  }) async {
    try {
      // dio request
      await dio.post(
        AppApi.verifyCode,
        data: FormData.fromMap(
          {"userEmail": email, "userVerifyCode": verificationCode},
        ),
        options: Options(headers: myheaders),
      );
    } on DioException catch (e) {
      AuthException.verifyCodeException(e);
    }
  }

  @override
  Future<void> resendVerifyCode({required String email}) async {
    try {
      // dio request
      await dio.post(
        AppApi.resendVerifyCode,
        data: FormData.fromMap(
          {"userEmail": email},
        ),
        options: Options(headers: myheaders),
      );
    } on DioException catch (e) {
      AuthException.resendCodeException(e);
    }
  }

  @override
  Future<void> forgetPassword({required String email}) async {
    try {
      // dio request
      await dio.post(
        AppApi.forgetPassword,
        data: FormData.fromMap(
          {"userEmail": email},
        ),
        options: Options(headers: myheaders),
      );
    } on DioException catch (e) {
      AuthException.forgetPassException(e);
    }
  }

  @override
  Future<void> resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      // dio request
      await dio.post(AppApi.resetPassword,
          data: FormData.fromMap({
            "userEmail": email,
            "newPassword": password,
            "confirmPassword": confirmPassword
          }),
          options: Options(headers: myheaders));
    } on DioException catch (e) {
      AuthException.resetPassException(e);
    }
  }

  @override
  Future<UserModel> logIn({
    required String email,
    required String password,
  }) async {
    try {
      // dio request
      final response = await dio.post(
        AppApi.logIn,
        data: FormData.fromMap({
          "userEmail": email,
          "userPassword": password,
        }),
        options: Options(headers: myheaders),
      );
      // decode from json to map
      return UserModel.fromJson(response.data['response']);
    } on DioException catch (e) {
      throw AuthException.logInException(e);
    }
  }
}
