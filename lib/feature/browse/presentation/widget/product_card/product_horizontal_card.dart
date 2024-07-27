import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/app_api.dart';
import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../core/entities/products_entity.dart';
import 'favorite_icon.dart';
import '../../../../../common/widgets/product/product_brand_rating.dart';
import '../../../../../common/widgets/product/product_name.dart';
import '../../../../../common/widgets/product/product_price.dart';

class ProductHorizontalCard extends StatelessWidget {
  const ProductHorizontalCard({super.key, required this.featuredProduct});

  final ProductEntity featuredProduct;

  double? _oldPrice() {
    if (featuredProduct.itemDescount != 0) {
      return ((featuredProduct.itemDescount * featuredProduct.itemPrice) /
              100) +
          featuredProduct.itemPrice;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    final isArabic = NFunctions.isArabic(context);
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
                      child: CachedNetworkImage(
                        fit: BoxFit.contain,
                        imageUrl:
                            "${AppApi.productsImage}/${featuredProduct.itemImage}",
                        errorWidget: (_, url, error) => const Center(
                          child: Icon(Icons.error_outline),
                        ),
                        progressIndicatorBuilder: (_, url, progress) =>
                            const CupertinoActivityIndicator(),
                      ),
                    ),
                    Positioned(
                      right: 0.0,
                      top: 0.0,
                      child: FavoriteIcon(product: featuredProduct),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // PRODUCT NAME
                      ProductName(
                        title: isArabic
                            ? featuredProduct.itemDescAr
                            : featuredProduct.itemNameEn,
                      ),
                      const SizedBox(height: NSizes.xs),
                      // PRODUCT BRAND AND RATING STAR
                      ProductBrandAndRating(
                        brand: featuredProduct.itemBrand,
                        rating: 4.35,
                      ),
                      const SizedBox(height: NSizes.xs),
                      const Spacer(flex: 2),
                      featuredProduct.itemDescount != 0
                          ? Text(
                              "${_oldPrice()!.toStringAsFixed(2).toString()} SR",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: NSizes.md
                                  ),
                              overflow : TextOverflow.ellipsis,
                              maxLines: 1,
                            )
                          : const SizedBox(),
                      const SizedBox(height: NSizes.xs),
                      // PRODUCT PRICE AND DISCOUNT PRICE
                      ProductPrice(
                        price: featuredProduct.itemPrice,
                        discount: featuredProduct.itemDescount,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
