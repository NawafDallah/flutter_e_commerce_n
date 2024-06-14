import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants/colors.dart';
import '../utils/constants/image_strings.dart';
import '../utils/constants/sizes.dart';

class FooterAuth extends StatelessWidget {
  const FooterAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: NColors.grey),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: NSizes.iconLg,
              image: AssetImage(NImages.google),
            ),
          ),
        ),
        SizedBox(width: NSizes.spaceBtwItems.w),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: NColors.grey),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: NSizes.iconLg,
              image: AssetImage(NImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
