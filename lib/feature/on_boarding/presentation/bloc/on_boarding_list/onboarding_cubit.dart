import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/entity/on_boarding_entity.dart';
import '../../../domain/use_case/get_on_boarding_list.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final GetOnBoardingListCase _getOnBoardingListCase;
  OnboardingCubit({required GetOnBoardingListCase getOnBoardingListCase})
      : _getOnBoardingListCase = getOnBoardingListCase,
        super(OnboardingInitialState());

  void getOnBoardingList() {
    final response = _getOnBoardingListCase();
    emit(OnboardingGetListState(response));
  }
}
