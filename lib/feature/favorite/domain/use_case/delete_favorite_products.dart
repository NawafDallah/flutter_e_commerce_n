import '../../../../core/entities/products_entity.dart';
import '../../../../core/use_cases/use_case.dart';
import '../repository/favorite_product_repo.dart';

class DeleteFavoriteProductsUseCase
    implements UseCaseLocale<void, List<ProductEntity>> {
  final FavoriteProductRepo _favoriteProductRepo;

  DeleteFavoriteProductsUseCase(
      {required FavoriteProductRepo favoriteProductRepo})
      : _favoriteProductRepo = favoriteProductRepo;

  @override
  Future<void> call({List<ProductEntity>? params}) async {
    return await _favoriteProductRepo.deleteFavoriteProducts(params!);
  }
}
