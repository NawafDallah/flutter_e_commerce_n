import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/functions/functions.dart';
import '../../../../common/widgets/responsive.dart';

class ImageContainer extends StatelessWidget {
  final double value;
  final String image;

  const ImageContainer({
    super.key,
    required this.image,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    final isArabic = NFunctions.isArabic(context);
    final isTablet = Responsive.isTablet(context);
    final opacity = lerpDouble(1.0, 0.0, value.clamp(0.0, 1.0))!;
    return Opacity(
      opacity: opacity,
      child: Container(
        transform: Responsive.isTablet(context)
            ? Matrix4.skew(0.0, value * -0.20)
            : Matrix4.skew(0.0, value * -0.30),
        alignment: Alignment.center,
        width: NFunctions.screenWidth(context) * 0.8,
        height: NFunctions.screenHeight(context) * 0.35,
        decoration: BoxDecoration(
          color: isDark ? NColors.black : NColors.white,
          borderRadius: BorderRadius.circular(25.0),
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 15.0,
              spreadRadius: 1.0,
              color: isDark ? NColors.darkGrey : NColors.darkerGrey,
            ),
            BoxShadow(
              offset: const Offset(-4, -2),
              color: isDark ? Colors.black : Colors.white,
              blurRadius: 10.0,
              spreadRadius: 5.0,
            ),
          ],
        ),
        child: Transform.rotate(
          angle: isArabic ? (pi / 3) * value : (pi / 2) * -value,
          child: Image(
            alignment: Alignment(isTablet ? 0.0 : value * 3, 0.0),
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
