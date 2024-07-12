import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/constants/sizes.dart';

class BrandContainer extends StatelessWidget {
  const BrandContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(NSizes.ms),
      decoration: BoxDecoration(
        border: Border.all(color: NColors.grey),
        borderRadius: BorderRadius.circular(
          NSizes.borderRadiusLg,
        ),
      ),
      child: Row(
        children: [
          // brand image
          Flexible(
            child: Image.asset("assets/icons/brands/nike.png"),
          ),

          // space
          const SizedBox(width: NSizes.spaceBtwItems / 2),

          // name of the brand
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nike",
                  style: Theme.of(context).textTheme.labelLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  "25 products",
                  style: Theme.of(context).textTheme.labelSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
