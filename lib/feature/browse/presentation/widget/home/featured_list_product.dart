import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/responsive.dart';
import '../../../../../core/entities/products_entity.dart';
import '../product_card/product_horizontal_card.dart';

class FeaturedListItems extends StatelessWidget {
  const FeaturedListItems({
    super.key,
    required this.homeFetchedNotifier,
    required this.featureds,
  });

  final bool homeFetchedNotifier;
  final List<ProductEntity> featureds;

  @override
  Widget build(BuildContext context) {
    final isSmallMobile = Responsive.isSmallMobile(context);
    return SizedBox(
      height: isSmallMobile
          ? NFunctions.screenHeight(context) * 0.25
          : NFunctions.screenHeight(context) * 0.20,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        slivers: [
          homeFetchedNotifier
              ? AnimationLimiter(
                  child: SliverList.builder(
                    itemCount: featureds.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        child: SlideAnimation(
                          verticalOffset: 150,
                          duration: const Duration(milliseconds: 600),
                          child: FadeInAnimation(
                            duration: const Duration(milliseconds: 900),
                            child: ProductHorizontalCard(
                              featuredProduct: featureds[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : SliverList.builder(
                  itemCount: featureds.length,
                  itemBuilder: (context, index) {
                    return ProductHorizontalCard(
                      featuredProduct: featureds[index],
                    );
                  },
                ),
        ],
      ),
    );
  }
}
