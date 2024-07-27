import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entity/home_entity.dart';
import '../../../../domain/use_case/get_home_data.dart';

part 'browse_event.dart';
part 'browse_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataCase _getHomeDataCase;

  HomeBloc({
    required GetHomeDataCase getHomeDataCase,
  })  : _getHomeDataCase = getHomeDataCase,
        super(const BrowseInitial()) {
    on<GetHomeDataEvent>(_getHomeData);
  }

  void _getHomeData(
    GetHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoadingStata());
    final catigories = await _getHomeDataCase();

    await Future.delayed(const Duration(seconds: 2), () {
      catigories.fold(
        (failure) => emit(HomeFailureStata(error: failure.message!)),
        (homeData) => emit(HomeDataSuccessStata(homeData: homeData)),
      );
    });
  }
}

class IsHomeFitchedCubit extends Cubit<bool> {
  IsHomeFitchedCubit() : super(false);

  void setFetched() {
    emit(true);
  }
}
