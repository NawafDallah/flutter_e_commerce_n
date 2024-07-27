import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    super.key,
    this.width,
    required this.height,
    required this.radius,
  });

  final double? width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        height: height,
        width: width,
        color: NColors.light,
      ),
    );
  }
}
