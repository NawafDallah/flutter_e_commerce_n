import '../../domain/repository/on_boarding_repository.dart';
import '../data_sources/static/on_boarding_service.dart';
import '../model/on_boarding_model.dart';

class OnBoardingRepositoryImp implements OnBoardingRepository {
  final OnBoardingService _onboardingService;

  OnBoardingRepositoryImp({
    required OnBoardingService onboardingService,
  }) : _onboardingService = onboardingService;

  @override
  List<OnBoardingModel> getOnBoardingList() {
    return _onboardingService.getOnBoardingList();
  }
}
