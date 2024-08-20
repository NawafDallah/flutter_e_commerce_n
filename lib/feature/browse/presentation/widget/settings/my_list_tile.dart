import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.color,
    required this.text,
    required this.trailing,
    required this.leadingIcon,
  });

  final Color color;
  final String text;
  final Widget trailing;
  final Widget leadingIcon;

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    return CupertinoListTile(
      backgroundColor: isDark ? NColors.dark : NColors.light,
      leading: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            NSizes.borderRadiusSm,
          ),
          shape: BoxShape.rectangle,
        ),
        child: leadingIcon,
      ),
      trailing: trailing,
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
