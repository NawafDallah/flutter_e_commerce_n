import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';

import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/responsive.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr(context),
          style:  Theme.of(context).textTheme.headlineMedium!
              .copyWith(fontSize:isTablet? 36 : 24),
        ),
        // SPACE
        const SizedBox(height: NSizes.spaceBtwItems),
        Text(
          subTitle.tr(context),
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(fontSize: isTablet ? 24 : 16),
        ),
      ],
    );
  }
}
