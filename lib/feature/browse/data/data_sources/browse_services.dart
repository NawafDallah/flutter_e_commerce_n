import 'package:dio/dio.dart';

import '../../../../common/utils/constants/api_secret.dart';
import '../../../../common/utils/constants/app_api.dart';
import '../../../../core/error/error_handler/browse_exceptions.dart';
import '../model/home_model.dart';
import '../model/product_model.dart';

abstract interface class BrowseService {
  Future<HomeModel> getHomeData();
  Future<void> deleteUser({required int userId});
  Future<void> updateUser({
    required int userId,
    required int userPhone,
    required String userName,
  });
  Future<List<ProductModel>> getProducts({
    required int categoryId,
    required int page,
    required int itemsPerPage,
  });
}

class BrowseServiceImp implements BrowseService {
  const BrowseServiceImp({required this.dio});

  final Dio dio;

  @override
  Future<HomeModel> getHomeData() async {
    try {
      final response = await dio.get(
        AppApi.home,
        options: Options(headers: myheaders),
      );
      return HomeModel.fromJson(response.data["response"]);
    } on DioException catch (e) {
      throw BrowseException.gethomeData(e);
    }
  }

  @override
  Future<List<ProductModel>> getProducts({
    required int categoryId,
    required int page,
    required int itemsPerPage,
  }) async {
    try {
      final response = await dio.get(
        "${AppApi.products}categoryId=$categoryId&page=$page&itemsPerPage=$itemsPerPage",
        options: Options(headers: myheaders),
      );
      List<ProductModel> products = response.data["response"]
          .map<ProductModel>(
              (e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return products;
    } on DioException catch (e) {
      throw BrowseException.getProducts(e);
    }
  }

  @override
  Future<void> deleteUser({required int userId}) async {
    try {
      await dio.delete(
        "${AppApi.deleteUser}userId=$userId",
        options: Options(headers: myheaders),
      );
    } on DioException catch (e) {
      throw BrowseException.deleteUser(e);
    }
  }

  @override
  Future<void> updateUser({
    required int userId,
    required int userPhone,
    required String userName,
  }) async {
    try {
      await dio.post(
        "${AppApi.updateUser}userId=$userId",
        options: Options(headers: myheaders),
        data: FormData.fromMap({
          "userName": userName,
          "userPhone": userPhone,
        }),
      );
    } on DioException catch (e) {
      throw BrowseException.updateUser(e);
    }
  }
}
