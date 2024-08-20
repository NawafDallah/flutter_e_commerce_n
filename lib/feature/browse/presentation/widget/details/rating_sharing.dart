import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';

class RatingAndSharing extends StatelessWidget {
  const RatingAndSharing({super.key, required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final isArabic = NFunctions.isArabic(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) => Transform.translate(
            offset: Offset(
              lerpDouble(isArabic ? 100 : -100, 0.0, animation.value)!,
              lerpDouble(-50, 0.0, animation.value)!,
            ),
            child: child,
          ),
          child: Row(
            children: [
              Text(
                "4.25",
                style: Theme.of(context).textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(width: NSizes.xs),
              const Icon(
                Iconsax.star5,
                color: NColors.secondary,
              ),
            ],
          ),
        ),
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) => Transform.translate(
            offset: Offset(
              lerpDouble(isArabic ? -100 : 100, 0.0, animation.value)!,
              lerpDouble(-50, 0.0, animation.value)!,
            ),
            child: child,
          ),
          child: const Icon(CupertinoIcons.share),
        )
      ],
    );
  }
}
