import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/functions/functions.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    final isArabic = NFunctions.isArabic(context);
    return Positioned(
      right: isArabic ? NFunctions.screenWidth(context) * 0.035 : null,
      left: isArabic ? null : NFunctions.screenWidth(context) * 0.035,
      bottom: kBottomNavigationBarHeight,
      child: SmoothPageIndicator(
        controller: _pageController,
        effect: SwapEffect(
          type: SwapType.yRotation,
          dotHeight: 5.0,
          dotWidth: NSizes.defaultSpace.w,
          activeDotColor: isDark ? NColors.light : NColors.dark,
        ),
        count: 3,
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      ),
    );
  }
}
