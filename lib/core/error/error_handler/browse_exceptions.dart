import 'package:dio/dio.dart';

import '../internet_exception.dart';

class BrowseException {
  const BrowseException._(); // TO AVOID CREATE AN INSTANCE

  static DioException gethomeData(DioException e) {
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 404:
          throw DioException(
            requestOptions: e.requestOptions,
            message: "somethingWrong",
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

  static DioException getProducts(DioException e) {
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 404:
          throw DioException(
            requestOptions: e.requestOptions,
            message: "noProductsFound",
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

  static DioException updateUser(DioException e) {
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 400:
          throw DioException(
            requestOptions: e.requestOptions,
            message: "failedToUpdateUserInfo",
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

  static DioException deleteUser(DioException e) {
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 400:
          throw DioException(
            requestOptions: e.requestOptions,
            message: "failedToDeleteUser",
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
}
