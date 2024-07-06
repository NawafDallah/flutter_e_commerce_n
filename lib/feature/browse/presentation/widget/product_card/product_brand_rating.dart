import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/constants/sizes.dart';

class ProductBrandAndRating extends StatelessWidget {
  const ProductBrandAndRating({
    super.key,
    required this.brand,
    required this.rating,
  });

  final String brand;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                brand,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(width: NSizes.xs),
              const Icon(
                Iconsax.verify5,
                color: NColors.buttonPrimary,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                rating.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(width: NSizes.xs),
              const Icon(
                Iconsax.star5,
                color: NColors.secondary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
