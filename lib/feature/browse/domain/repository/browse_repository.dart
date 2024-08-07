import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/home_entity.dart';
import '../../../../core/entities/products_entity.dart';

abstract interface class BrowseRepository {
  // GET ALL HOME DATA FROM DATA-BASE
  Future<Either<Failure, HomeEntity>> getHomeData();
  // GET ALL PRODUCTS FROM DATA-BASE
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    required int categoryId,
    required int page,
    required int itemsPerPage,
  });
  // DELETE USER FROM DATA-BASE
  Future<Either<Failure, void>> deleteUser({
    required int userId,
  });
  // UPDATE USER INFO ON DATA-BASE
  Future<Either<Failure, void>> updateUser({
    required int userId,
    required int userPhone,
    required String userName,
  });
}
