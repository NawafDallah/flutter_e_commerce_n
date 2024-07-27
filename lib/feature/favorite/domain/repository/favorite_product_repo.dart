import '../../../../core/entities/products_entity.dart';

abstract interface class FavoriteProductRepo {
  // Floor methods

  // GET PRODUCTS FROM LOCAL DATABASE --FLOOR--
  Future<List<ProductEntity>> getFavoriteProduct();

  // ADD PRODUCT TO LOCAL DATABASE --FLOOR--
  Future<void> addFavoriteProduct(ProductEntity product);

  // DELETE PRODUCTS FROM LOCAL DATABASE --FLOOR--
  Future<void> deleteFavoriteProducts(List<ProductEntity> products);

  // DELETE PRODUCT FROM LOCAL DATABASE --FLOOR--
  Future<void> deleteFavoriteProduct(ProductEntity product);
}
