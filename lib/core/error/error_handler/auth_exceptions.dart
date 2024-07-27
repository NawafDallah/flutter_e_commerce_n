import 'package:dio/dio.dart';

import '../internet_exception.dart';

class AuthException {
  const AuthException._(); // TO AVOID CREATE AN INSTANCE

  static void signUpException(DioException e) {
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 409:
          if (e.response!.data['response']
              .toString()
              .contains("email already exist")) {
            throw DioException(
              requestOptions: e.requestOptions,
              message: "emailExist",
            );
          } else {
            throw DioException(
              requestOptions: e.requestOptions,
              message: "phoneExist",
            );
          }
        case 400:
          if (e.response!.data['response']
              .toString()
              .contains("Fill in required fields")) {
            throw DioException(
              requestOptions: e.requestOptions,
              message: "thisfieldisrequired",
            );
          } else {
            throw DioException(
              requestOptions: e.requestOptions,
              message: "invalidemailaddress",
            );
          }
        case 401:
          throw DioException(
            requestOptions: e.requestOptions,
            message: "thisfieldisrequired",
          );
        default:
          throw DioException(
            requestOptions: e.requestOptions,
            message: "somethingWrong",
          );
      }
    } else {
      throw InternetException.internetException(e);
    }
  }

  static void verifyCodeException(DioException e) {
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 400:
          if (e.response!.data['response']
              .toString()
              .contains("Invalid verification code")) {
            throw DioException(
              requestOptions: e.requestOptions,
              message: "invalidCode",
            );
          } else {
            throw DioException(
              requestOptions: e.requestOptions,
              message: "verificationCodeRequired",
            );
          }
        case 410:
          throw DioException(
            requestOptions: e.requestOptions,
            message: "verificationCodeExpired",
          );
        default:
          throw DioException(
            requestOptions: e.requestOptions,
            message: "somethingWrong",
          );
      }
    } else {
      throw InternetException.internetException(e);
    }
  }

  static DioException logInException(DioException e) {
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 400:
          if (e.response!.data['response']
              .toString()
              .contains("Fill in required fields")) {
            throw DioException(
              requestOptions: e.requestOptions,
              message: "thisfieldisrequired",
            );
          } else {
            throw DioException(
              requestOptions: e.requestOptions,
              message: "invalidemailaddress",
            );
          }
        case 401:
          throw DioException(
            requestOptions: e.requestOptions,
            message: "incorrectEmailPassword",
          );
        case 403:
          throw DioException(
            requestOptions: e.requestOptions,
            message: "userNotVerified",
          );
        default:
          throw DioException(
            requestOptions: e.requestOptions,
            message: "somethingWrong",
          );
      }
    } else {
      throw InternetException.internetException(e);
    }
  }

  static void resendCodeException(DioException e) {
    if (e.response != null) {
      switch (e.response!.statusCode) {
        default:
          throw DioException(
            requestOptions: e.requestOptions,
            message: "somethingWrong",
          );
      }
    } else {
      throw InternetException.internetException(e);
    }
  }

  static void forgetPassException(DioException e) {
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 400:
          if (e.response!.data['response']
              .toString()
              .contains("Fill in required fields")) {
            throw DioException(
              requestOptions: e.requestOptions,
              message: "thisfieldisrequired",
            );
          } else {
            throw DioException(
              requestOptions: e.requestOptions,
              message: "invalidemailaddress",
            );
          }
        case 404:
          throw DioException(
            requestOptions: e.requestOptions,
            message: "emailNotExist",
          );
        default:
          throw DioException(
            requestOptions: e.requestOptions,
            message: "somethingWrong",
          );
      }
    } else {
      throw InternetException.internetException(e);
    }
  }

  static void resetPassException(DioException e) {
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 400:
          if (e.response!.data['response']
              .toString()
              .contains("Fill in required fields")) {
            throw DioException(
              requestOptions: e.requestOptions,
              message: "thisfieldisrequired",
            );
          } else {
            throw DioException(
              requestOptions: e.requestOptions,
              message: "passwordsNotMatch",
            );
          }
        default:
          throw DioException(
            requestOptions: e.requestOptions,
            message: "somethingWrong",
          );
      }
    } else {
      throw InternetException.internetException(e);
    }
  }
}
