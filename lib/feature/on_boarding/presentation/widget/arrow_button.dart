import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/functions/functions.dart';
import '../../../../config/routes/routes.dart';
import '../../../../core/cubits/middleware/middleware_cubit.dart';
import '../bloc/on_boarding_navigation.dart/on_boarding_navigation_cubit.dart';

class ArrowButton extends StatelessWidget {
  final PageController pageController;
  const ArrowButton({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    final isEnglish = NFunctions.isEnglish(context);
    return BlocBuilder<OnBoardingNavigationCubit, OnBoardingNavigationState>(
      builder: (context, state) {
        return Positioned(
          right: isEnglish ? NFunctions.screenWidth(context) * 0.035 : null,
          left: isEnglish ? null : NFunctions.screenWidth(context) * 0.035,
          bottom: kBottomNavigationBarHeight,
          child: AnimatedOpacity(
            opacity: state.currentPage! == 2 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 150),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: isDark ? NColors.primary : NColors.dark,
                  foregroundColor: isDark ? NColors.dark : NColors.white),
              onPressed: () {
                context
                    .read<MiddlewareCubit>()
                    .changeMiddleWarePage(Routes.login);
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes.login, (route) => false);
              },
              child: Icon(
                isEnglish ? Iconsax.arrow_right_3 : Iconsax.arrow_left_2,
              ),
            ),
          ),
        );
      },
    );
  }
}
