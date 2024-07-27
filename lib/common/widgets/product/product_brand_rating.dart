import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            children: [
              Flexible(
                child: Text(
                  brand,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: NSizes.xs),
              const Icon(
                Iconsax.verify5,
                color: NColors.buttonPrimary,
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              rating.toStringAsFixed(2),
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
    );
  }
}
