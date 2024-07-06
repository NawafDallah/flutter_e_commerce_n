import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/responsive.dart';
import '../widget/home/app_bar_capertino.dart';
import '../widget/home/catigories.dart';
import '../widget/home/featured_grid_product.dart';
import '../widget/home/featured_list_product.dart';
import '../widget/home/section_title.dart';
import '../widget/home/slider_banner.dart';
import '../widget/home/welcome_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final ScrollController _scrollController;
  late final PageController _pageController;
  final _scrollNotifire = ValueNotifier<double>(0.0);
  final _pageNotifire = ValueNotifier<double>(0.0);
  // late final Timer _timer;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollListener);
    _pageController = PageController(
      viewportFraction: 0.85,
    )..addListener(_pageListener);
    // sliderBannerTimer();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    _pageController
      ..removeListener(_pageListener)
      ..dispose();
    // _timer.cancel();
    super.dispose();
  }

  _scrollListener() {
    _scrollNotifire.value = _scrollController.offset;
  }

  _pageListener() {
    if (_pageController.hasClients && _pageController.position.haveDimensions) {
      _pageNotifire.value = _pageController.page!;
    }
  }

  // void sliderBannerTimer() {
  //   _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
  //     if (_pageController.hasClients && _pageController.page != null) {
  //       if (_pageController.page!.toInt() < 4) {
  //         _pageController.nextPage(
  //           duration: const Duration(milliseconds: 850),
  //           curve: Curves.easeInOut,
  //         );
  //       } else {
  //         _pageController.animateToPage(
  //           0,
  //           duration: const Duration(milliseconds: 850),
  //           curve: Curves.easeInOut,
  //         );
  //       }
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    final isSmallMobile = Responsive.isSmallMobile(context);
    return Scaffold(
      body: CupertinoScrollbar(
        controller: _scrollController,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _scrollController,
          slivers: [
            // Cupertino App Bar IOS style
            AppBarCupertino(scrollNotifire: _scrollNotifire),
            // REFRESH INDICATOR TO FITCH DATA
            const CupertinoSliverRefreshControl(),
            // LIST OF HOME SECTIONS
            SliverList(
              delegate: SliverChildListDelegate([
                // THE WELCOME TEXT
                const WelcomeTexts(),

                // SPACE
                SizedBox(
                    height: isTablet
                        ? NSizes.spaceBtwSections
                        : isSmallMobile
                            ? null
                            : NSizes.spaceBtwItems),

                // CATIGORIES GRID VIEW
                const Catigories(),

                const Divider(thickness: 5.0),

                // SPACE
                SizedBox(
                    height: isTablet
                        ? NSizes.spaceBtwSections
                        : isSmallMobile
                            ? null
                            : NSizes.spaceBtwItems),

                // HORIZONTAL BANNER
                SliderBanner(
                  pageController: _pageController,
                  pageNotifire: _pageNotifire,
                ),

                const Divider(thickness: 3.0),

                // TITLE OF THE SECTION
                const SectionTitle(title: "Featured"),
                // FEATURED PRODUCT LIST
                const FeaturedListItems(),

                // SPACE
                SizedBox(
                    height: isTablet
                        ? NSizes.spaceBtwSections
                        : isSmallMobile
                            ? null
                            : NSizes.spaceBtwItems),

                const Divider(thickness: 3.0),

                // TITLE OF THE SECTION
                const SectionTitle(title: "Populer product"),
                const PopulerGridItems(),

                // SPACE
                const SizedBox(height: NSizes.spaceBtwSections),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
