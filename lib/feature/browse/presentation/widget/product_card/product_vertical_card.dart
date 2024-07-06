import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/responsive.dart';
import 'favorite_icon.dart';
import 'product_brand_rating.dart';
import 'product_name.dart';
import 'product_price.dart';
import 'stacked_circle_avatar.dart';

class ProductVerticalCard extends StatelessWidget {
  const ProductVerticalCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    final isSmallMobile = Responsive.isSmallMobile(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: isSmallMobile ? 8.0 : 8.0),
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
          Column(
            children: [
              Image.asset(
                "assets/images/products/iphone_12_red.png",
                height: 160,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    discount: null,
                  ),
                ],
              )
            ],
          ),
          ...List.generate(
            3.clamp(0, 3),
            (index) => StackedCircleAvatar(
              index: index,
              isVertical: true,
            ),
          ),
          Positioned(
            right: 0.0,
            bottom: 0.0,
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                  color: NColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(NSizes.borderRadiusLg),
                    topLeft: Radius.circular(NSizes.borderRadiusLg),
                  )),
            ),
          ),
          const FavoriteIcon(),
          const ProductDicount(),
        ],
      ),
    );
  }
}

class ProductDicount extends StatelessWidget {
  const ProductDicount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10.0,
      top: 10.0,
      child: Container(
        width: 45,
        height: 23,
        decoration: BoxDecoration(
          color: NColors.primary,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(
            NSizes.borderRadiusSm,
          ),
        ),
        child: Center(
          child: Text(
            "15%",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
