import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/functions/functions.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isDark
            ? NColors.dark.withOpacity(0.5)
            : NColors.white.withOpacity(0.5),
      ),
      child: const Icon(Iconsax.heart),
    );
  }
}
