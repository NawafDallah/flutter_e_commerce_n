import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/on_boarding_list/onboarding_cubit.dart';
import '../bloc/on_boarding_navigation.dart/on_boarding_navigation_cubit.dart';
import '../widget/arrow_button.dart';
import '../widget/dot_indicator.dart';
import '../widget/horizental_scrollable_list.dart';
import '../widget/skip_button.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final valueListener = ValueNotifier<double>(0.0);
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0)
      ..addListener(_pageListener);
    context.read<OnboardingCubit>().getOnBoardingList();
    super.initState();
  }

  @override
  void dispose() {
    _pageController
      ..removeListener(_pageListener)
      ..dispose();
    super.dispose();
  }

  _pageListener() {
    if (_pageController.position.haveDimensions) {
      valueListener.value = _pageController.page!;
    }

    /// same as the above way!!!

    // valueListener.value =
    //     _pageController.offset / NFunctions.screenWidth(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: Stack(
        children: [
          // Horizental scrollable page
          ValueListenableBuilder(
              valueListenable: valueListener,
              builder: (_, value, __) {
                final onBoardingState = context.watch<OnboardingCubit>().state;
                final list = onBoardingState.onBoardingList!;
                return PageView.builder(
                  controller: _pageController,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  onPageChanged: (value) {
                    context
                        .read<OnBoardingNavigationCubit>()
                        .onPageChanged(value);
                  },
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return HorizentalScrollablePage(
                      content: list[index].content.tr(context),
                      image: list[index].image,
                      title: list[index].title.tr(context),
                      value: value - index,
                    );
                  },
                );
              }),
    
          //skip button
          SkipButton(pageController: _pageController),
    
          //dotes indicator
          DotIndicator(pageController: _pageController),
    
          //arrowed button
          ArrowButton(pageController: _pageController),
        ],
      ),
    );
  }
}
