import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/functions/functions.dart';
import '../../../../common/widgets/responsive.dart';
import '../bloc/browse/home_bloc/browse_bloc.dart';
import '../widget/home/app_bar_capertino.dart';
import '../widget/home/catigories.dart';
import '../widget/home/fade_logo.dart';
import '../widget/home/pobuler_grid_product.dart';
import '../widget/home/featured_list_product.dart';
import '../widget/home/section_title.dart';
import '../widget/home/slider_banner.dart';
import '../widget/home/welcome_text.dart';
import '../widget/shimmer/home_page_shimmer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final ScrollController _scrollController;
  late final PageController _pageController;
  final _scrollNotifire = ValueNotifier<double>(0.0);
  final _logoNotifire = ValueNotifier<double>(0.0);
  final _pageNotifire = ValueNotifier<double>(0.0);
  final _homeFetchedNotifier = ValueNotifier<bool>(false);
  // late final Timer _timer;

  @override
  void initState() {
    isHomeFetched();
    _scrollController = ScrollController()..addListener(_scrollListener);
    _pageController = PageController(viewportFraction: 0.85)
      ..addListener(_pageListener);
    // sliderBannerTimer();
    super.initState();
  }

  // check if home page is fetched or not to reduce num of request
  // on the server, onle fitched once when you open the app
  // or using the refresh indecator by your self.
  void isHomeFetched() async {
    final isFetched = context.read<IsHomeFitchedCubit>().state;
    if (!isFetched) {
      context.read<HomeBloc>().add(const GetHomeDataEvent());
      context.read<IsHomeFitchedCubit>().setFetched();
      _homeFetchedNotifier.value = true;
    }
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
    // Calculate the over-scroll amount
    double overScroll = _scrollController.offset -
        (_scrollController.position.maxScrollExtent + 50);
    if (overScroll > 0) {
      _logoNotifire.value = (overScroll / 200).clamp(0.0, 1.0);
    } else {
      _logoNotifire.value = 0.0;
    }
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
      body: Stack(
        children: [
          // BOTTOM FADE LOGO
          FadeLogo(logoNotifire: _logoNotifire),
          CupertinoScrollbar(
            controller: _scrollController,
            child: BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {
                if (state is HomeFailureStata) {
                  NFunctions.showSnackBar(context, state.error.tr(context));
                }
              },
              builder: (context, state) {
                if (state is HomeLoadingStata) {
                  return ShimmerHomePage(scrollController: _scrollController);
                }
                if (state is HomeDataSuccessStata) {
                  return CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    controller: _scrollController,
                    slivers: [
                      // Cupertino App Bar IOS style
                      AppBarCupertino(scrollNotifire: _scrollNotifire),

                      // THE REFRESH INDICATOR IOS STYLE TO FITCH DATA
                      CupertinoSliverRefreshControl(onRefresh: () async {
                        context.read<HomeBloc>().add(const GetHomeDataEvent());
                        _homeFetchedNotifier.value = true;
                      }),

                      // THE WELCOME TEXT
                      const SliverToBoxAdapter(child: WelcomeTexts()),

                      // SPACE
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: isTablet
                              ? NSizes.spaceBtwSections
                              : isSmallMobile
                                  ? null
                                  : NSizes.spaceBtwItems,
                        ),
                      ),

                      // CATIGORIES GRID VIEW
                      ValueListenableBuilder<bool>(
                        valueListenable: _homeFetchedNotifier,
                        builder: (context, homeFetchedNotifier, child) {
                          return Catigories(
                            homeFetchedNotifier: homeFetchedNotifier,
                            catigories: state.homeData.catigories,
                          );
                        },
                      ),

                      // DIVIDER
                      const SliverToBoxAdapter(child: Divider(thickness: 3.0)),

                      // SPACE
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: isTablet
                              ? NSizes.spaceBtwSections
                              : isSmallMobile
                                  ? null
                                  : NSizes.spaceBtwItems,
                        ),
                      ),

                      // HORIZONTAL BANNER
                      ValueListenableBuilder<bool>(
                        valueListenable: _homeFetchedNotifier,
                        builder: (context, homeFetchedNotifier, child) {
                          return SliverToBoxAdapter(
                            child: SliderBanner(
                              pageController: _pageController,
                              pageNotifire: _pageNotifire,
                              banners: state.homeData.banners,
                              homeFetchedNotifier: homeFetchedNotifier,
                            ),
                          );
                        },
                      ),

                      // DIVIDER
                      const SliverToBoxAdapter(child: Divider(thickness: 3.0)),

                      // TITLE OF THE SECTION
                      SliverToBoxAdapter(
                        child: SectionTitle(
                          title: "featured".tr(context),
                          padding: 16.0,
                        ),
                      ),

                      // FEATURED PRODUCT LIST VIEW
                      ValueListenableBuilder(
                        valueListenable: _homeFetchedNotifier,
                        builder: (_, homeFetchedNotifier, __) {
                          return SliverToBoxAdapter(
                              child: FeaturedListItems(
                            featureds: state.homeData.featured,
                            homeFetchedNotifier: homeFetchedNotifier,
                          ));
                        },
                      ),

                      // SPACE
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: isTablet
                              ? NSizes.spaceBtwSections
                              : isSmallMobile
                                  ? null
                                  : NSizes.spaceBtwItems,
                        ),
                      ),

                      // DIVIDER
                      const SliverToBoxAdapter(child: Divider(thickness: 3.0)),

                      // TITLE OF THE SECTION
                      SliverToBoxAdapter(
                        child: SectionTitle(
                          title: "populerProduct".tr(context),
                          padding: 16.0,
                        ),
                      ),

                      // SPACE
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: isTablet
                              ? NSizes.spaceBtwSections
                              : NSizes.spaceBtwItems,
                        ),
                      ),

                      // POPULER PRODUCT GRID VIEW
                      ValueListenableBuilder(
                        valueListenable: _homeFetchedNotifier,
                        builder: (_, homeFetchedNotifier, __) {
                          return PopulerGridItems(
                            populars: state.homeData.popular,
                          );
                        },
                      ),

                      // SPACE
                      const SliverToBoxAdapter(
                        child:
                            SizedBox(height: kBottomNavigationBarHeight * 1.5),
                      ),
                    ],
                  );
                }
                return Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/on_boarding_images/sammy-line-no-connection.gif",
                      ),
                      Text(
                        "somethingWrong".tr(context),
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
