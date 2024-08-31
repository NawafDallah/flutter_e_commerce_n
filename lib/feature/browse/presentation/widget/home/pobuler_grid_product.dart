import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/widgets/responsive.dart';
import '../../../../../core/entities/products_entity.dart';
import '../../screen/details_page.dart';
import '../product_card/product_vertical_card.dart';

class PopulerGridItems extends StatelessWidget {
  const PopulerGridItems({super.key, required this.populars});

  final List<ProductEntity> populars;

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return SliverGrid.builder(
      itemCount: populars.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isTablet ? 3 : 2,
        mainAxisSpacing: 35,
        mainAxisExtent: NSizes.cradVerticallHeight,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            PageRouteBuilder(
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: const Interval(0.0, 0.5),
                ),
                child: child,
              ),
              pageBuilder: (_, animation, __) => DetailsPage(
                product: populars[index],
                animation: animation,
              ),
            ),
          ),
          child: ProductVerticalCard(product: populars[index]),
        );
      },
    );
  }
}
