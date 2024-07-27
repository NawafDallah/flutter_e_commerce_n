import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entity/home_entity.dart';
import '../repository/browse_repository.dart';

class GetHomeDataCase implements UseCase<HomeEntity, void> {
  final BrowseRepository _browseRepository;

  GetHomeDataCase({required BrowseRepository browseRepository})
      : _browseRepository = browseRepository;

  @override
  Future<Either<Failure, HomeEntity>> call({void params}) async {
    return _browseRepository.getHomeData();
  }
}
