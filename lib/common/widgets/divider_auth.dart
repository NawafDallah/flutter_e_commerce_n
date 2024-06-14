import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';

import '../utils/constants/colors.dart';
import '../utils/functions/functions.dart';
import 'responsive.dart';

class DividerAuth extends StatelessWidget {
  final String text;
  const DividerAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    final isTablet = Responsive.isTablet(context);
    return Row(
      children: [
        Flexible(
          child: Divider(
            color: isDark ? NColors.darkGrey : NColors.grey,
            thickness: 1,
            indent: isTablet ? 60 : 30,
            endIndent: 5,
          ),
        ),
        Text(
          text.tr(context),
          style: isTablet
              ? Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 20)
              : Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: isDark ? NColors.darkGrey : NColors.grey,
            thickness: 1,
            indent: 5, 
            endIndent: isTablet ? 60 : 30,
          ),
        ),
      ],
    );
  }
}
