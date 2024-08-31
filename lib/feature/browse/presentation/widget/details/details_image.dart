import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/app_api.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../core/entities/products_entity.dart';

class DetailsImage extends StatelessWidget {
  const DetailsImage({
    super.key,
    required this.product
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final screenHight = NFunctions.screenHeight(context);
    return Positioned(
      top: screenHight * 0.1,
      right: screenHight * 0.05,
      left: screenHight * 0.05,
      height: screenHight * 0.35,
      child: Hero(
        tag: product.itemImage,
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          errorWidget: (_, url, error) => const Center(
            child: Icon(Icons.error_outline),
          ),
          progressIndicatorBuilder: (_, url, progress) =>
              const CupertinoActivityIndicator(),
          imageUrl: "${AppApi.productsImage}/${product.itemImage}",
        ),
      ),
    );
  }
}
