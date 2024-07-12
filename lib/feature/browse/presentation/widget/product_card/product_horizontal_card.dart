import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';
import 'favorite_icon.dart';
import 'product_brand_rating.dart';
import 'product_name.dart';
import 'product_price.dart';
import 'stacked_circle_avatar.dart';

class ProductHorizontalCard extends StatelessWidget {
  const ProductHorizontalCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    return Container(
      width: NSizes.cradHorizontalWidth,
      margin: const EdgeInsets.symmetric(
        horizontal: NSizes.md,
        vertical: NSizes.md,
      ),
      decoration: BoxDecoration(
        border: Border.symmetric(
          vertical: BorderSide(
            color: isDark ? NColors.darkerGrey : NColors.grey,
          ),
        ),
        color: isDark ? NColors.black : NColors.white,
        borderRadius: BorderRadius.circular(NSizes.borderRadiusLg),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        "assets/images/products/iphone_12_blue.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      right: 0.0,
                      top: 0.0,
                      child: FavoriteIcon(),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // PRODUCT NAME
                    ProductName(title: "name of product"),
                    SizedBox(height: NSizes.xs),
                    // PRODUCT BRAND AND RATING STAR
                    ProductBrandAndRating(
                      brand: "brand",
                      rating: 4.35,
                    ),
                    SizedBox(height: NSizes.xs),
                    // PRODUCT PRICE AND DISCOUNT PRICE
                    ProductPrice(
                      price: 5680,
                      discount: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
          ...List.generate(
            3.clamp(0, 3),
            (index) => StackedCircleAvatar(
              index: index,
              isVertical: false,
            ),
          ),
        ],
      ),
    );
  }
}
