part of 'browse_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class BrowseInitial extends HomeState {
  const BrowseInitial();
}

////////////////  HOME SUCCESS ////////////////

final class HomeDataSuccessStata extends HomeState {
  final HomeEntity homeData;

  const HomeDataSuccessStata({required this.homeData});

  @override
  List<Object> get props => [homeData];
}

////////////////  HOME FAILURE ////////////////

final class HomeFailureStata extends HomeState {
  final String error;
  const HomeFailureStata({required this.error});

  @override
  List<Object> get props => [error];
}

////////////////  HOME LOADING ////////////////

final class HomeLoadingStata extends HomeState {
  const HomeLoadingStata();
}
