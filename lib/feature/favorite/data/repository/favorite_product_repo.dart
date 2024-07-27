import 'package:flutter_e_commerce_n_1/core/entities/products_entity.dart';

import '../../domain/repository/favorite_product_repo.dart';
import '../data_sources/app_database.dart';
import '../model/favorite_product_model.dart';

class FavoriteProductRepoImp implements FavoriteProductRepo {
  final AppDatabase _appDatabase;

  const FavoriteProductRepoImp({required AppDatabase appDatabase})
      : _appDatabase = appDatabase;

  @override
  Future<void> addFavoriteProduct(ProductEntity product) async {
    return await _appDatabase.favoriteProductDao.addProductToFavorite(
      FavoriteProductModel.fromEntity(product),
    );
  }

  @override
  Future<void> deleteFavoriteProducts(List<ProductEntity> products) async {
    return await _appDatabase.favoriteProductDao.deleteFavoriteProducts(
      List<FavoriteProductModel>.from(products),
    );
  }

  @override
  Future<void> deleteFavoriteProduct(ProductEntity product) async {
    return await _appDatabase.favoriteProductDao
        .deleteFavoriteProduct(FavoriteProductModel.fromEntity(product));
  }

  @override
  Future<List<FavoriteProductModel>> getFavoriteProduct() async {
    return await _appDatabase.favoriteProductDao.getFavoriteProduct();
  }
}
