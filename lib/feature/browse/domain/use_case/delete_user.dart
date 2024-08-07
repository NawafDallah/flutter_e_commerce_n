import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../repository/browse_repository.dart';

class DeleteUserCase implements UseCase<void, int> {
  final BrowseRepository _browseRepository;

  DeleteUserCase({required BrowseRepository browseRepository})
      : _browseRepository = browseRepository;

  @override
  Future<Either<Failure, void>> call({int? params}) async {
    return _browseRepository.deleteUser(userId: params!);
  }
}
