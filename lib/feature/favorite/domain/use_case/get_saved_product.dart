import '../../../../core/entities/products_entity.dart';
import '../../../../core/use_cases/use_case.dart';
import '../repository/favorite_product_repo.dart';

class GetSavedProductUseCase
    implements UseCaseLocale<List<ProductEntity>, void> {
  final FavoriteProductRepo _favoriteProductRepo;

  GetSavedProductUseCase({required FavoriteProductRepo favoriteProductRepo})
      : _favoriteProductRepo = favoriteProductRepo;

  @override
  Future<List<ProductEntity>> call({void params}) async {
    return await _favoriteProductRepo.getFavoriteProduct();
  }
}
