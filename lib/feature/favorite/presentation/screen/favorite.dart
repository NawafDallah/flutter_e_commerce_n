import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_n_1/common/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/functions/functions.dart';
import '../../../../common/widgets/responsive.dart';
import '../../../browse/presentation/bloc/is_clicked/is_clicked_cubit.dart';
import '../../../browse/presentation/widget/home/fade_logo.dart';
import '../../../browse/presentation/widget/product_card/favorite_vertical_card.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  late final ScrollController _scrollController;
  final _scrollNotifier = ValueNotifier<double>(0.0);
  List<TestData> test = [
    TestData(testFlag: false, name: "one"),
    TestData(testFlag: true, name: "two"),
    TestData(testFlag: true, name: "three"),
    TestData(testFlag: true, name: "four"),
    TestData(testFlag: true, name: "five"),
    TestData(testFlag: true, name: "six"),
  ];

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  _scrollListener() {
    // Calculate the over-scroll amount
    double overScroll =
        _scrollController.offset - _scrollController.position.maxScrollExtent;
    if (overScroll > 0) {
      _scrollNotifier.value = (overScroll / 200).clamp(0.0, 1.0);
    } else {
      _scrollNotifier.value = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    final isTablet = Responsive.isTablet(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => IsEditBtnClickedCubit(),
        ),
        BlocProvider(
          create: (context) => IsFavoriteCardClickedCubit(),
        ),
      ],
      child: Scaffold(
        body: CupertinoScrollbar(
          controller: _scrollController,
          child: Stack(
            children: [
              // BOTTOM FADE LOGO
              FadeLogo(logoNotifire: _scrollNotifier),
              CustomScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  CupertinoSliverNavigationBar(
                    backgroundColor:
                        isDark ? NColors.black.withOpacity(0.5) : NColors.light,
                    automaticallyImplyLeading: false,
                    stretch: true,
                    largeTitle: Text(
                      "favorite".tr(context),
                      style: TextStyle(
                        color: isDark ? NColors.light : NColors.dark,
                      ),
                    ),
                    leading: BlocBuilder<IsEditBtnClickedCubit, bool>(
                      builder: (context, state) {
                        return AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: state ? 1.0 : 0.0,
                          child: const IconButton(
                            onPressed: null,
                            color: NColors.primary,
                            icon: Icon(Iconsax.trash),
                          ),
                        );
                      },
                    ),
                    trailing: BlocBuilder<IsEditBtnClickedCubit, bool>(
                      builder: (context, state) {
                        return AnimatedCrossFade(
                          duration: const Duration(milliseconds: 150),
                          crossFadeState: state
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          alignment: Alignment.center,
                          firstChild: GestureDetector(
                            onTap: () {
                              context.read<IsEditBtnClickedCubit>().isCicked();
                            },
                            child: Text(
                              "Edit",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          secondChild: GestureDetector(
                            onTap: () {
                              context.read<IsEditBtnClickedCubit>().isCicked();
                            },
                            child: Text(
                              "Done",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      top: 16.0,
                      bottom: kBottomNavigationBarHeight * 1.5,
                    ),
                    sliver: SliverAnimatedGrid(
                      initialItemCount: test.length,
                      itemBuilder: (context, index, animation) =>
                          BlocBuilder<IsEditBtnClickedCubit, bool>(
                        builder: (context, state) {
                          return FavoriteVerticalCard(
                            isClicked: state,
                            index: index,
                          );
                        },
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isTablet ? 3 : 2,
                        mainAxisSpacing: 35,
                        mainAxisExtent: NSizes.cradVerticallHeight,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestData {
  final bool testFlag;
  final String name;

  TestData({required this.testFlag, required this.name});
}
