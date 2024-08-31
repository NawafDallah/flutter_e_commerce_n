import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../../../core/entities/products_entity.dart';
import '../repository/browse_repository.dart';

class SearchProductCase implements UseCase<List<ProductEntity>, String> {
  final BrowseRepository _browseRepository;

  SearchProductCase({required BrowseRepository browseRepository})
      : _browseRepository = browseRepository;

  @override
  Future<Either<Failure, List<ProductEntity>>> call({String? params}) async {
    return await _browseRepository.searchProduct(productName: params!);
  }
}
