import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../domain/entity/catigory_entity.dart';

class CatigoriesTabBar extends StatelessWidget {
  const CatigoriesTabBar({super.key, required this.categories});

  final List<CatigoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    final isArabic = NFunctions.isArabic(context);
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
          categories.length,
          (index) => Tab(
            text: isArabic
                ? categories[index].categoryNameAr
                : categories[index].categoryNameEn,
          ),
        ),
      ),
    );
  }
}
