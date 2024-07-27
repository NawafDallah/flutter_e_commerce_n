import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/utils/constants/app_api.dart';
import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/functions/functions.dart';
import '../../../../common/widgets/product/product_brand_rating.dart';
import '../../../../common/widgets/product/product_discount.dart';
import '../../../../common/widgets/product/product_name.dart';
import '../../../../core/entities/products_entity.dart';

class FavoriteVerticalCard extends StatelessWidget {
  const FavoriteVerticalCard({
    super.key,
    this.isEditBtnClicked = false,
    required this.isCardSelected,
    required this.product,
  });

  final bool isEditBtnClicked;
  final bool isCardSelected;
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
                height: 160,
                fit: BoxFit.contain,
                imageUrl: "${AppApi.productsImage}/${product.itemImage}",
                errorWidget: (_, url, error) => const Center(
                  child: Icon(Icons.error_outline),
                ),
                progressIndicatorBuilder: (_, url, progress) =>
                    const CupertinoActivityIndicator(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Column(
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
                    // PRODUCT PRICE AND DISCOUNT PRICE
                    const SizedBox(height: NSizes.xs),
                    if (product.itemDescount != 0)
                      Text(
                        "${_oldPrice()!.toStringAsFixed(2).toString()} SR",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                decoration: TextDecoration.lineThrough,
                                fontSize: NSizes.md),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    // PRODUCT PRICE AND DISCOUNT PRICE
                    Text(
                      '${product.itemPrice.toStringAsFixed(2)} SR',
                      style: Theme.of(context).textTheme.headlineSmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 10.0,
            top: 10.0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 900),
              opacity: isEditBtnClicked ? 0.0 : 1.0,
              child: product.itemDescount != 0
                  ? ProductDicount(discount: product.itemDescount)
                  : null,
            ),
          ),
          Positioned(
            right: 5.0,
            bottom: 10.0,
            child: Transform.scale(
              scale: 1.3,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 900),
                opacity: isEditBtnClicked ? 1.0 : 0.0,
                child: Checkbox.adaptive(
                  shape: const CircleBorder(),
                  value: isCardSelected,
                  onChanged: (value) {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
