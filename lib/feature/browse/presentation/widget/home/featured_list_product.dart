import 'package:flutter/material.dart';

import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/responsive.dart';
import '../product_card/product_horizontal_card.dart';

class FeaturedListItems extends StatelessWidget {
  const FeaturedListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isSmallMobile = Responsive.isSmallMobile(context);
    return SizedBox(
      height: isSmallMobile
          ? NFunctions.screenHeight(context) * 0.25
          : NFunctions.screenHeight(context) * 0.20,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return const ProductHorizontalCard();
        },
      ),
    );
  }
}
