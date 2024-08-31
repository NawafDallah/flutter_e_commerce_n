import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/responsive.dart';
import '../../../../../config/routes/routes.dart';
import '../../../../../init_dependencies.dart';
import '../../../domain/entity/catigory_entity.dart';
import '../../bloc/browse/search_product/search_product_bloc.dart';
import '../../screen/search.dart';
import 'search_capertino.dart';

class AppBarCupertino extends StatelessWidget {
  const AppBarCupertino({
    super.key,
    required this.scrollNotifire,
    required this.catigories,
  });

  final ValueNotifier<double> scrollNotifire;
  final List<CatigoryEntity> catigories;

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    final isArabic = NFunctions.isArabic(context);
    return CupertinoSliverNavigationBar(
      automaticallyImplyLeading: false,
      automaticallyImplyTitle: false,
      backgroundColor: isDark ? NColors.black : NColors.white,
      leading: const _LeadingAppBar(),
      trailing: ValueListenableBuilder(
          valueListenable: scrollNotifire,
          builder: (_, value, __) {
            return _FadeIcon(
              value: value,
              catigories: catigories,
              icon: const Icon(
                Iconsax.search_normal,
                size: NSizes.iconSm * 1.8,
                color: NColors.primary,
              ),
            );
          }),
      largeTitle: Padding(
        padding: EdgeInsets.only(
          top: NSizes.sm,
          left: isArabic ? NSizes.md : 0.0,
          right: isArabic ? 0.0 : NSizes.md,
        ),
        child: OpenContainer(
          transitionDuration: const Duration(milliseconds: 500),
          transitionType: ContainerTransitionType.fade,
          openColor: isDark ? NColors.black : NColors.white,
          closedColor: CupertinoColors.tertiarySystemFill,
          closedBuilder: (context, action) => const SearchBarCupertino(),
          openBuilder: (context, action) => BlocProvider(
              create: (context) => sl<SearchProductBloc>(),
              child: SearchPage(catigories: catigories)),
        ),
      ),
    );
  }
}

class _LeadingAppBar extends StatelessWidget {
  const _LeadingAppBar();

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

class _FadeIcon extends StatelessWidget {
  const _FadeIcon({
    required this.value,
    required this.icon,
    required this.catigories,
  });
  final double value;
  final Widget icon;
  final List<CatigoryEntity> catigories;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: value >= kToolbarHeight ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 200),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.pushNamed(context, Routes.search, arguments: catigories);
        },
        icon: icon,
      ),
    );
  }
}
