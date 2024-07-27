import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../../../core/entities/products_entity.dart';
import '../repository/browse_repository.dart';

class GetProductsCase implements UseCase<List<ProductEntity>, ProductParams> {
  final BrowseRepository _browseRepository;

  GetProductsCase({required BrowseRepository browseRepository})
      : _browseRepository = browseRepository;

  @override
  Future<Either<Failure, List<ProductEntity>>> call(
      {ProductParams? params}) async {
    return _browseRepository.getProducts(
      categoryId: params!.catigoryId,
      page: params.page,
      itemsPerPage: params.itemsPerPage,
    );
  }
}

class ProductParams {
  final int catigoryId;
  final int page;
  final int itemsPerPage;

  const ProductParams({
    required this.catigoryId,
    required this.page,
    required this.itemsPerPage,
  });
}
