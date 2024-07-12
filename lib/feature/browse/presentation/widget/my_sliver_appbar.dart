import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/functions/functions.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({
    super.key,
    required this.backgroundSpaceBar,
    required this.tabBar,
  });

  final Widget backgroundSpaceBar;
  final Widget? tabBar;

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: isDark ? NColors.black : NColors.white,
      expandedHeight: kToolbarHeight * 7,
      collapsedHeight: kToolbarHeight * 2,
      leading: BackButton(
        color: isDark ? NColors.light : NColors.dark,
      ),
      title: Text(
        "store".tr(context),
        style: Theme.of(context).textTheme.titleLarge,
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.none,
        expandedTitleScale: 1.0,
        titlePadding: EdgeInsets.zero,
        title: tabBar,
        background: backgroundSpaceBar,
      ),
    );
  }
}
