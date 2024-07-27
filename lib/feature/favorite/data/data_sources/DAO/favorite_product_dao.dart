import 'package:floor/floor.dart';

import '../../model/favorite_product_model.dart';

@dao
abstract class FavoriteProductDao {
  @Insert()
  Future<void> addProductToFavorite(FavoriteProductModel product);

  @delete
  Future<void> deleteFavoriteProducts(List<FavoriteProductModel> products);

  @delete
  Future<void> deleteFavoriteProduct(FavoriteProductModel product);

  @Query("SELECT * FROM favorite_product")
  Future<List<FavoriteProductModel>> getFavoriteProduct();
}
