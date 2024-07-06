import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/responsive.dart';

class AppBarCupertino extends StatelessWidget {
  const AppBarCupertino({
    super.key,
    required this.scrollNotifire,
  });

  final ValueNotifier<double> scrollNotifire;

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    return CupertinoSliverNavigationBar(
      automaticallyImplyLeading: false,
      automaticallyImplyTitle: false,
      backgroundColor: isDark ? NColors.black : NColors.white,
      leading: const LeadingAppBar(),
      middle: const SizedBox(),
      transitionBetweenRoutes: true,
      trailing: ValueListenableBuilder(
          valueListenable: scrollNotifire,
          builder: (_, value, __) {
            return FadeIcon(value: value);
          }),
      largeTitle: const Padding(
        padding: EdgeInsets.only(right: 16.0),
        child: CupertinoSearchTextField(
          decoration: BoxDecoration(
              color: CupertinoColors.tertiarySystemFill,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              border: Border(bottom: BorderSide(color: NColors.primary))),
        ),
      ),
    );
  }
}


class LeadingAppBar extends StatelessWidget {
  const LeadingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Iconsax.location,
          size: isTablet ? 25.0 : 20.0,
          color: NColors.primary,
        ),
        const SizedBox(width: NSizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            LimitedBox(
              maxWidth: NFunctions.screenWidth(context) / 2,
              child: Text(
                'deleverTo'.tr(context),
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: isTablet ? 18.0 : null),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            LimitedBox(
              maxWidth: NFunctions.screenWidth(context) / 1.5,
              child: Text(
                'location data and information',
                style: Theme.of(context).textTheme.labelMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FadeIcon extends StatelessWidget {
  final double value;
  const FadeIcon({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      excludeBottomFocus: true,
      alignment: const AlignmentDirectional(1.0, -1.0),
      firstChild: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: const Icon(
          Iconsax.search_normal,
          size: 28,
          color: NColors.primary,
        ),
      ),
      secondChild: const SizedBox(),
      crossFadeState: value >= kToolbarHeight
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 100),
      sizeCurve: Curves.ease,
    );
  }
}
