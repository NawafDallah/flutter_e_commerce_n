import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/widgets/responsive.dart';
import '../product_card/product_vertical_card.dart';

class PopulerGridItems extends StatelessWidget {
  const PopulerGridItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return SliverGrid.builder(
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isTablet ? 3 : 2,
        mainAxisSpacing: 35,
        mainAxisExtent: NSizes.cradVerticallHeight,
      ),
      itemBuilder: (context, index) {
        return const ProductVerticalCard();
      },
    );
  }
}
