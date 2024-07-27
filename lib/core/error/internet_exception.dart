import 'package:dio/dio.dart';

class InternetException {
  const InternetException._();

  static DioException internetException(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.sendTimeout) {
      throw DioException(
        requestOptions: e.requestOptions,
        message: "noInternetConnection",
      );
    } else {
      throw DioException(
        requestOptions: e.requestOptions,
        message: "SomethingWrong",
      );
    }
  }
}
