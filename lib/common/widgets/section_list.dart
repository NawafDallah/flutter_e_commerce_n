import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
import '../utils/functions/functions.dart';

class SectionList extends StatelessWidget {
  const SectionList({
    super.key,
    this.tilesList,
    required this.text,
  });

  final List<Widget>? tilesList;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    return CupertinoListSection.insetGrouped(
      backgroundColor: isDark ? NColors.black : NColors.white,
      separatorColor: isDark ? NColors.black : NColors.white,
      dividerMargin: 0.0,
      additionalDividerMargin: 0.0,
      header: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      children: tilesList!,
    );
  }
}
