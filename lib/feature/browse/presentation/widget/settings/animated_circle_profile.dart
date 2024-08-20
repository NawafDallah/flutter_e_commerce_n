import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/functions/functions.dart';

class AnimatedCircleProfile extends StatelessWidget {
  const AnimatedCircleProfile({
    super.key,
    required this.value,
    this.child,
  });

  final double value;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    return Align(
      alignment: AlignmentDirectional.lerp(
        const AlignmentDirectional(0.0, 0.85),
        const AlignmentDirectional(-1.0, 0.0),
        value,
      )!,
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 100),
        width: value == 0 ? 75.0 : 40.0,
        height: value == 0 ? 75.0 : 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDark ? NColors.dark : NColors.light,
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: value == 0
                  ? 2.0
                  : isDark
                      ? 0.0
                      : 2.0,
              spreadRadius: 0.0,
              color: isDark ? NColors.darkGrey : NColors.darkerGrey,
            ),
            BoxShadow(
              offset: const Offset(2, 2),
              color: isDark ? Colors.black : Colors.white,
              blurRadius: value == 0
                  ? 3.0
                  : isDark
                      ? 0.0
                      : 3.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: FittedBox(child: child),
      ),
    );
  }
}
