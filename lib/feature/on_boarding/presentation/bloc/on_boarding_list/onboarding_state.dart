part of 'onboarding_cubit.dart';

@immutable
sealed class OnboardingState extends Equatable {
  final List<OnBoardingEntity>? onBoardingList;

  const OnboardingState({this.onBoardingList});

  @override
  List<Object> get props => [onBoardingList!];
}

final class OnboardingInitialState extends OnboardingState {}

final class OnboardingGetListState extends OnboardingState {
  const OnboardingGetListState(List<OnBoardingEntity>? onBoardingList)
      : super(onBoardingList: onBoardingList);
}
