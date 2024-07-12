import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/constants/sizes.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.price,
    this.discount,
  });

  final double price;
  final int? discount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              '${price.toStringAsFixed(1)} SR',
              style: Theme.of(context).textTheme.headlineSmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          discount == null
              ? const SizedBox()
              : Container(
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
                      "$discount%",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
