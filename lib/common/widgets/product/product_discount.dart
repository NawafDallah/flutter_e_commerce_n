import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class ProductDicount extends StatelessWidget {
  const ProductDicount({super.key, required this.discount});

  final int discount;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 45,
      height: 25,
      decoration: BoxDecoration(
        color: NColors.primary,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(
          NSizes.borderRadiusSm,
        ),
      ),
      child: FittedBox(
        child: Center(
          child: Text(
            "${discount.toString()}%",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
