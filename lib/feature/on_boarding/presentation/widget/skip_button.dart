import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import '../../../../common/utils/functions/functions.dart';
import '../../../../common/widgets/responsive.dart';
import '../bloc/on_boarding_navigation.dart/on_boarding_navigation_cubit.dart';

class SkipButton extends StatelessWidget {
  final PageController pageController;
  const SkipButton({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final isEngilsh = NFunctions.isEnglish(context);
    return BlocBuilder<OnBoardingNavigationCubit, OnBoardingNavigationState>(
      builder: (context, state) {
        return Positioned(
          right: isEngilsh ? NFunctions.screenWidth(context) * 0.035 : null,
          left: isEngilsh ? null : NFunctions.screenWidth(context) * 0.035,
          top: NFunctions.screenHeight(context) * 0.045,
          child: AnimatedOpacity(
            opacity: state.currentPage! == 2 ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 150),
            child: TextButton(
              onPressed: () {
                pageController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: Text(
                'skip'.tr(context),
                style: Responsive.isTablet(context)
                    ? Theme.of(context).textTheme.headlineMedium
                    : Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        );
      },
    );
  }
}
