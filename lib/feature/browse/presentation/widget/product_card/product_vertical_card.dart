import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/app_api.dart';
import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/product/product_discount.dart';
import '../../../../../core/entities/products_entity.dart';
import 'favorite_icon.dart';
import '../../../../../common/widgets/product/product_brand_rating.dart';
import '../../../../../common/widgets/product/product_name.dart';

class ProductVerticalCard extends StatelessWidget {
  const ProductVerticalCard({super.key, required this.product});

  final ProductEntity product;

  double? _oldPrice() {
    if (product.itemDescount != 0) {
      return ((product.itemDescount * product.itemPrice) / 100) +
          product.itemPrice;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    final isArabic = NFunctions.isArabic(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
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
              CachedNetworkImage(
                fit: BoxFit.contain,
                errorWidget: (_, url, error) => const Center(
                  child: Icon(Icons.error_outline),
                ),
                progressIndicatorBuilder: (_, url, progress) =>
                    const CupertinoActivityIndicator(),
                imageUrl: "${AppApi.productsImage}/${product.itemImage}",
                height: 160,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductName(
                    title: isArabic ? product.itemNameAr : product.itemNameEn,
                  ),
                  const SizedBox(height: NSizes.xs),
                  // PRODUCT BRAND AND RATING STAR
                  ProductBrandAndRating(
                    brand: product.itemBrand,
                    rating: 4.3554,
                  ),
                  const SizedBox(height: NSizes.xs),
                  product.itemDescount != 0
                      ? Text(
                          "${_oldPrice()!.toStringAsFixed(2).toString()} SR",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: NSizes.md),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      : const SizedBox(),
                  // PRODUCT PRICE AND DISCOUNT PRICE
                  Text(
                    '${product.itemPrice.toStringAsFixed(2)} SR',
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
          // ...List.generate(
          //   3.clamp(0, 3),
          //   (index) => StackedCircleAvatar(
          //     index: index,
          //     isVertical: true,
          //   ),
          // ),
          Positioned(
            right: 0.0,
            top: 0.0,
            child: FavoriteIcon(product: product),
          ),
          Positioned(
            left: 0.0,
            top: 10.0,
            child: product.itemDescount == 0
                ? const SizedBox()
                : ProductDicount(discount: product.itemDescount),
          ),
        ],
      ),
    );
  }
}
