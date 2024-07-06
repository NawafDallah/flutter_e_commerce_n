import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/responsive.dart';

class CatigoryCard extends StatelessWidget {
  const CatigoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    final isTablet = Responsive.isTablet(context);
    final isSmallMobile = Responsive.isSmallMobile(context);
    return Column(
      children: [
        Container(
          height: isTablet
              ? 80
              : isSmallMobile
                  ? 50
                  : 60,
          width: isTablet
              ? 80
              : isSmallMobile
                  ? 50
                  : 60,
          decoration: BoxDecoration(
            color: isDark ? NColors.white : NColors.black,
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(
              invertColors: isDark ? false : true,
              fit: BoxFit.contain,
              matchTextDirection: true,
              image: const AssetImage(
                "assets/icons/categories/icons8-bowling-64.png",
              ),
            ),
          ),
        ),
        const SizedBox(height: NSizes.sm),
        Text(
          "catigory",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: isTablet ? 18 : null,
              ),
        )
      ],
    );
  }
}
