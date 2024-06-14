import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/responsive.dart';

class OnBordingText extends StatelessWidget {
  const OnBordingText({
    super.key,
    required this.title,
    required this.content,
    required this.value,
  });

  final String title;
  final String content;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: lerpDouble(1.0, 0.0, value.clamp(0.0, 1.0))!,
      child: Column(
        children: [
          Text(
            title,
            style: Responsive.isTablet(context)
                ? Theme.of(context).textTheme.headlineLarge
                : Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 18.0.h),
          Text(
            content,
            style: Responsive.isTablet(context)
                ? Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 26)
                : Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
