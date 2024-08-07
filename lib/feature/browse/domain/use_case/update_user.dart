import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../repository/browse_repository.dart';

class UpdateUserCase implements UseCase<void, UpdateUserParams> {
  final BrowseRepository _browseRepository;

  UpdateUserCase({required BrowseRepository browseRepository})
      : _browseRepository = browseRepository;

  @override
  Future<Either<Failure, void>> call({UpdateUserParams? params}) async {
    return _browseRepository.updateUser(
      userId: params!.userId,
      userPhone: params.userPhone,
      userName: params.userName,
    );
  }
}

class UpdateUserParams {
  final int userId;
  final int userPhone;
  final String userName;

  UpdateUserParams({
    required this.userId,
    required this.userPhone,
    required this.userName,
  });
}
