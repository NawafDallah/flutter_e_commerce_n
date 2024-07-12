import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/functions/functions.dart';

class CatigoriesTabBar extends StatelessWidget {
  const CatigoriesTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    return ColoredBox(
      color: isDark ? NColors.black : NColors.white,
      child: TabBar(
        physics: const BouncingScrollPhysics(),
        isScrollable: true,
        padding: EdgeInsets.zero,
        indicatorColor: NColors.primary,
        unselectedLabelColor: NColors.darkGrey,
        labelColor: NColors.secondary,
        tabs: List.generate(
          8,
          (index) => Tab(
            text: "sport $index",
          ),
        ),
      ),
    );
  }
}
