import '../../../../../common/utils/constants/image_strings.dart';
import '../../model/on_boarding_model.dart';

abstract interface class OnBoardingService {
  List<OnBoardingModel> getOnBoardingList();
}

class OnBoardingServiceImp implements OnBoardingService {
  const OnBoardingServiceImp();

  @override
  List<OnBoardingModel> getOnBoardingList() {
    final List<OnBoardingModel> onBoardingList = [
      const OnBoardingModel(
        title: "onBoardingTitle1",
        image: NImages.onBoardingImage1,
        content: "onBoardingSubTitle1",
      ),
      const OnBoardingModel(
        title: "onBoardingTitle2",
        image: NImages.onBoardingImage2,
        content: "onBoardingSubTitle2",
      ),
      const OnBoardingModel(
        title: "onBoardingTitle3",
        image: NImages.onBoardingImage3,
        content: "onBoardingSubTitle3",
      ),
    ];
    return onBoardingList;
  }
}
