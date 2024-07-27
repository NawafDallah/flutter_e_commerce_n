import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/app_api.dart';
import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/responsive.dart';
import '../../../domain/entity/catigory_entity.dart';

class CatigoryCard extends StatelessWidget {
  const CatigoryCard({super.key, required this.catigory});

  final CatigoryEntity catigory;

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    final isTablet = Responsive.isTablet(context);
    final isSmallMobile = Responsive.isSmallMobile(context);
    return Column(
      children: [
        Container(
          height: isTablet
              ? 80
              : isSmallMobile
                  ? 50
                  : 60,
          width: isTablet
              ? 80
              : isSmallMobile
                  ? 50
                  : 60,
          decoration: BoxDecoration(
            color: isDark ? NColors.white : NColors.black,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Image.network(
            "${AppApi.catigoriesImage}/${catigory.categoryImage}",
            color: isDark ? NColors.black : NColors.white,
            fit: BoxFit.contain,
            alignment: Alignment.center,
          ),
        ),
        const SizedBox(height: NSizes.sm),
        Text(
          NFunctions.isArabic(context)
              ? catigory.categoryNameAr
              : catigory.categoryNameEn,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: isTablet ? 18 : null,
              ),
        ),
      ],
    );
  }
}
