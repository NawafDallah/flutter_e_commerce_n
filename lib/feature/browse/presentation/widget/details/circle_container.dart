import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/functions/functions.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({super.key, required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final screenHight = NFunctions.screenHeight(context);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Positioned(
        top: -screenHight * 0.15,
        right: -screenHight * 0.2,
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 300),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (_, value, __) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: value * (screenHight * 0.5),
            height: value * (screenHight * 0.5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: NColors.primary.withOpacity(0.9),
            ),
          ),
        ),
      ),
    );
  }
}
