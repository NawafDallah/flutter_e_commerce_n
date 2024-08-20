import 'dart:ui';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/functions/functions.dart';
import '../../../../common/widgets/product/product_discount.dart';
import '../../../../common/widgets/responsive.dart';
import '../../../../common/widgets/shack_transition.dart';
import '../../../../core/entities/products_entity.dart';
import '../bloc/browse/detail_counter/details_counter_cubit.dart';
import '../widget/details/brand_text.dart';
import '../widget/details/circle_container.dart';
import '../widget/details/details_bottom_part.dart';
import '../widget/details/details_image.dart';
import '../widget/details/rating_sharing.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.product,
    required this.animation,
  });

  final ProductEntity product;
  final Animation<double> animation;

  double? _oldPrice() {
    if (product.itemDescount != 0) {
      return ((product.itemDescount * product.itemPrice) / 100) +
          product.itemPrice;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    final isArabic = NFunctions.isArabic(context);
    return BlocProvider(
      create: (context) => DetailsCounterCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  expandedHeight: isTablet
                      ? NFunctions.screenHeight(context) * 0.50
                      : NFunctions.screenHeight(context) * 0.41,
                  stretch: true,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    stretchModes: const [
                      StretchMode.blurBackground,
                      StretchMode.zoomBackground,
                    ],
                    background: Stack(
                      children: [
                        // circle container
                        CircleContainer(animation: animation),

                        // brand text
                        BrandText(product: product),

                        // Image
                        DetailsImage(product: product),

                        // Close Icon
                        AnimatedBuilder(
                          animation: animation,
                          builder: (_, child) => Positioned(
                            left: lerpDouble(-72, NSizes.md, animation.value),
                            top:
                                lerpDouble(-72, NSizes.md * 2, animation.value),
                            // for better performance
                            child: child!,
                          ),
                          child: const CloseButton(
                            style: ButtonStyle(
                              splashFactory: NoSplash.splashFactory,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: NSizes.md,
                    vertical: NSizes.sm,
                  ),
                  sliver: SliverList.list(children: [
                    // rating and sharing
                    RatingAndSharing(animation: animation),

                    // space
                    const SizedBox(height: NSizes.ms),

                    // produt name
                    ShakeTransition(
                      deltaX: 20,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        isArabic ? product.itemNameAr : product.itemNameEn,
                        style: Theme.of(context).textTheme.headlineMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),

                    // space
                    const SizedBox(height: NSizes.ms),

                    // product price
                    ShakeTransition(
                      deltaX: 40,
                      duration: const Duration(milliseconds: 1000),
                      child: Row(
                        children: [
                          if (product.itemDescount != 0)
                            ProductDicount(discount: product.itemDescount),
                          if (product.itemDescount != 0)
                            const SizedBox(width: NSizes.md),
                          Text(
                            "${product.itemPrice.toStringAsFixed(2)} SR",
                            style: Theme.of(context).textTheme.headlineMedium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(width: NSizes.sm),
                          if (product.itemDescount != 0)
                            Text(
                              "${_oldPrice()!.toStringAsFixed(2).toString()} SR",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: NSizes.md),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                        ],
                      ),
                    ),

                    // space
                    const SizedBox(height: NSizes.md),

                    // product describtion title
                    ShakeTransition(
                      deltaX: 40,
                      duration: const Duration(seconds: 1),
                      child: Text(
                        "description".tr(context),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),

                    // space
                    const SizedBox(height: NSizes.sm),

                    // product describtion
                    ShakeTransition(
                      deltaX: 60,
                      duration: const Duration(seconds: 1),
                      child: Text(
                        isArabic ? product.itemDescAr : product.itemDescEn,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ]),
                )
              ],
            ),
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) => Positioned(
                bottom: lerpDouble(-100, 0.0, animation.value),
                left: 0.0,
                right: 0.0,
                child: const ShakeTransition(
                  deltaY: 10,
                  duration: Duration(seconds: 1),
                  child: DetailsBottomPart(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
