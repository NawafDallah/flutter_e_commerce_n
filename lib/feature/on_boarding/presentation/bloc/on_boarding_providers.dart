import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../init_dependencies.dart';
import '../screen/on_boarding.dart';
import 'on_boarding_list/onboarding_cubit.dart';
import 'on_boarding_navigation.dart/on_boarding_navigation_cubit.dart';

class OnBoardingProviders extends StatelessWidget {
  const OnBoardingProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingCubit>(
          create: (context) => sl<OnboardingCubit>(),
        ),
        BlocProvider<OnBoardingNavigationCubit>(
          create: ((context) => OnBoardingNavigationCubit()),
        ),
      ],
      child: const OnBoardingPage(),
    );
  } 
}
