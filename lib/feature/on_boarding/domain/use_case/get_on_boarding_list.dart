import '../entity/on_boarding_entity.dart';
import '../repository/on_boarding_repository.dart';

class GetOnBoardingListCase {
  final OnBoardingRepository _onBoardingRepository;

  GetOnBoardingListCase({
    required OnBoardingRepository onBoardingRepository,
  }) : _onBoardingRepository = onBoardingRepository;

  List<OnBoardingEntity> call() {
    return _onBoardingRepository.getOnBoardingList();
  }
}
