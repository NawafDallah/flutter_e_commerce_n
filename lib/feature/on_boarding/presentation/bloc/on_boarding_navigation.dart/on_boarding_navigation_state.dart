part of 'on_boarding_navigation_cubit.dart';

sealed class OnBoardingNavigationState extends Equatable {
  final int? currentPage;
  const OnBoardingNavigationState({this.currentPage});

  @override
  List<Object> get props => [currentPage!];
}

final class OnBoardingChangePageState extends OnBoardingNavigationState {
  const OnBoardingChangePageState(int currentPage)
      : super(currentPage: currentPage);
}
