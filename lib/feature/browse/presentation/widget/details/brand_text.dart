import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/responsive.dart';
import '../../../../../common/widgets/shack_transition.dart';
import '../../../../../core/entities/products_entity.dart';

class BrandText extends StatelessWidget {
  const BrandText({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    final screenHight = NFunctions.screenHeight(context);
    return Positioned(
      top: screenHight * 0.07,
      right: isTablet ? 50.0 : 0.0,
      left: isTablet ? 50.0 : 0.0,
      child: Padding(
        padding: const EdgeInsets.all(NSizes.ms * 3),
        child: FittedBox(
          child: ShakeTransition(
            deltaY: 10.0,
            duration: const Duration(seconds: 1),
            child: Text(
              product.itemBrand.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
    );
  }
}
