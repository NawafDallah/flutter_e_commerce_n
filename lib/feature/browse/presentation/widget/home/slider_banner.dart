import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/responsive.dart';

class SliderBanner extends StatelessWidget {
  const SliderBanner({
    super.key,
    required PageController pageController,
    required this.pageNotifire,
  }) : _pageController = pageController;

  final PageController _pageController;
  final ValueNotifier<double> pageNotifire;

  @override
  Widget build(BuildContext context) {
    final isArabic = NFunctions.isArabic(context);
    final isTablet = Responsive.isTablet(context);
    return Column(
      children: [
        SizedBox(
          height: NFunctions.screenHeight(context) * 0.25,
          child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ValueListenableBuilder(
                    valueListenable: pageNotifire,
                    builder: (_, value, __) {
                      return Container(
                        alignment:
                            AlignmentDirectional((value - index).abs(), 0.0),
                        margin:
                            const EdgeInsets.symmetric(horizontal: NSizes.md),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(NSizes.borderRadiusLg),
                          image: DecorationImage(
                            alignment: AlignmentDirectional(
                                (value - index).abs(), (value - index).abs()),
                            matchTextDirection: true,
                            fit: BoxFit.cover,
                            image: const AssetImage(
                                "assets/images/banners/banner_7.jpg"),
                          ),
                        ),
                      );
                    });
              }),
        ),
        const SizedBox(height: NSizes.spaceBtwItems),
        SmoothPageIndicator(
          controller: _pageController,
          count: 5,
          effect: SwapEffect(
            dotHeight: isTablet ? 6.0 : 4.0,
            dotWidth: isTablet ? 20.0 : 12.0,
            activeDotColor: NColors.primary,
          ),
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        ),
      ],
    );
  }
}
