import 'package:flutter/material.dart';

import '../../../../../common/widgets/responsive.dart';
import '../product_card/product_vertical_card.dart';

class PopulerGridItems extends StatelessWidget {
  const PopulerGridItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isTablet ? 3 : 2,
          mainAxisSpacing: 35,
          mainAxisExtent: 280),
      itemBuilder: (context, index) {
        return const ProductVerticalCard();
      },
    );
  }
}
