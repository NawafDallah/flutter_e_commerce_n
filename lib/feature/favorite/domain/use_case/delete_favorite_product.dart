import '../../../../core/entities/products_entity.dart';
import '../../../../core/use_cases/use_case.dart';
import '../repository/favorite_product_repo.dart';

class DeleteFavoriteProductUseCase
    implements UseCaseLocale<void, ProductEntity> {
  final FavoriteProductRepo _favoriteProductRepo;

  DeleteFavoriteProductUseCase(
      {required FavoriteProductRepo favoriteProductRepo})
      : _favoriteProductRepo = favoriteProductRepo;

  @override
  Future<void> call({ProductEntity? params}) async {
    return await _favoriteProductRepo.deleteFavoriteProduct(params!);
  }
}
