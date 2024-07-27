part of 'browse_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class GetHomeDataEvent extends HomeEvent {
  const GetHomeDataEvent();
}

