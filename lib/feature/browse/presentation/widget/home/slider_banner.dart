import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/app_api.dart';
import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/responsive.dart';
import '../../../domain/entity/banners_entity.dart';

class SliderBanner extends StatelessWidget {
  const SliderBanner({
    super.key,
    required PageController pageController,
    required this.pageNotifire,
    required this.banners,
    required this.homeFetchedNotifier,
  }) : _pageController = pageController;

  final PageController _pageController;
  final ValueNotifier<double> pageNotifire;
  final List<BannerEntity> banners;
  final bool homeFetchedNotifier;

  @override
  Widget build(BuildContext context) {
    final isArabic = NFunctions.isArabic(context);
    final isTablet = Responsive.isTablet(context);
    return Column(
      children: [
        SizedBox(
          height: NFunctions.screenHeight(context) * 0.25,
          child: AnimationLimiter(
            child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                itemCount: banners.length,
                itemBuilder: (context, index) {
                  return ValueListenableBuilder(
                      valueListenable: pageNotifire,
                      builder: (_, value, __) {
                        return homeFetchedNotifier
                            ? AnimationConfiguration.staggeredList(
                                position: 0,
                                child: SlideAnimation(
                                  verticalOffset: -150,
                                  // horizontalOffset: -50,
                                  duration: const Duration(milliseconds: 250),
                                  child: FadeInAnimation(
                                    duration: const Duration(milliseconds: 600),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: NSizes.md),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            NSizes.borderRadiusLg),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          NSizes.borderRadiusLg,
                                        ),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          alignment: Alignment(
                                            (value - index).abs(),
                                            (value - index).abs(),
                                          ),
                                          errorWidget: (_, url, error) =>
                                              const Center(
                                            child: Icon(Icons.error_outline),
                                          ),
                                          progressIndicatorBuilder: (_, url,
                                                  progress) =>
                                              const CupertinoActivityIndicator(),
                                          imageUrl:
                                              "${AppApi.bannersImage}/${banners[index].bannerImage}",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: NSizes.md),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      NSizes.borderRadiusLg),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    NSizes.borderRadiusLg,
                                  ),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    alignment: Alignment(
                                      (value - index).abs(),
                                      (value - index).abs(),
                                    ),
                                    errorWidget: (_, url, error) =>
                                        const Center(
                                      child: Icon(Icons.error_outline),
                                    ),
                                    progressIndicatorBuilder:
                                        (_, url, progress) =>
                                            const CupertinoActivityIndicator(),
                                    imageUrl:
                                        "${AppApi.bannersImage}/${banners[index].bannerImage}",
                                  ),
                                ),
                              );
                      });
                }),
          ),
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
