import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repository/browse_repository.dart';
import '../data_sources/browse_services.dart';
import '../model/home_model.dart';
import '../model/product_model.dart';

class BrowseRepositoryImp implements BrowseRepository {
  final BrowseService _browseService;

  BrowseRepositoryImp({required BrowseService browseService})
      : _browseService = browseService;

  @override
  Future<Either<Failure, HomeModel>> getHomeData() async {
    try {
      final homeData = await _browseService.getHomeData();
      return Right(homeData);
    } on DioException catch (e) {
      return Left(Failure(message: e.message!));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts({
    required int categoryId,
    required int page,
    required int itemsPerPage,
  }) async {
    try {
      final products = await _browseService.getProducts(
        categoryId: categoryId,
        page: page,
        itemsPerPage: itemsPerPage,
      );
      return Right(products);
    } on DioException catch (e) {
      return Left(Failure(message: e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser({required int userId}) async {
    try {
      final response = await _browseService.deleteUser(userId: userId);
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure(message: e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser({
    required int userId,
    required int userPhone,
    required String userName,
  }) async {
    try {
      final response = await _browseService.updateUser(
        userId: userId,
        userName: userName,
        userPhone: userPhone,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(Failure(message: e.message!));
    }
  }
}
