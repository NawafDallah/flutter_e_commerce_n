import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import 'common/utils/constants/colors.dart';
import 'common/utils/constants/sizes.dart';
import 'common/utils/functions/functions.dart';
import 'common/widgets/responsive.dart';
import 'feature/favorite/presentation/screen/favorite.dart';
import 'feature/browse/presentation/bloc/browse/home_bloc/browse_bloc.dart';
import 'core/cubits/nav_bar_index/nav_bar_index_cubit.dart';
import 'feature/browse/presentation/screen/home.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    final isTablet = Responsive.isTablet(context);
    List pages = [
      const Home(),
      Container(color: Colors.yellow),
      const Favorite(),
      Container(color: Colors.red),
    ];
    List bottomNavBarIcons = [
      Iconsax.home,
      Iconsax.box_1,
      Iconsax.heart,
      Iconsax.more,
    ];
    List navBarColors = <Color?>[
      Colors.purple,
      Colors.yellow,
      Colors.green,
      Colors.red,
    ];
    return PopScope(
      canPop: false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NavBarIndexCubit(),
          ),
          BlocProvider(
            create: (context) => IsHomeFitchedCubit(),
          ),
        ],
        child: BlocBuilder<NavBarIndexCubit, SelectedIndex>(
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              extendBody: true,
              bottomNavigationBar: Container(
                clipBehavior: Clip.antiAlias,
                padding: const EdgeInsets.only(
                  left: NSizes.xl,
                  right: NSizes.xl,
                  bottom: NSizes.lg,
                ),
                decoration: BoxDecoration(
                  color: isDark ? NColors.black : NColors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(NSizes.borderRadiusLg),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                      bottomNavBarIcons.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<NavBarIndexCubit>()
                                .selectedIndex(index);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 100),
                                height: 6.0,
                                width: state.index == index
                                    ? isTablet
                                        ? 35.0
                                        : 25.0
                                    : 0.0,
                                margin: const EdgeInsets.only(bottom: 8.0),
                                decoration: BoxDecoration(
                                    color: navBarColors[index],
                                    borderRadius: BorderRadius.circular(12.0),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 50,
                                        spreadRadius: 25,
                                        offset: const Offset(0.0, 30.0),
                                        color: state.index == index
                                            ? navBarColors[index]
                                            : Colors.transparent,
                                      ),
                                    ]),
                              ),
                              Icon(
                                bottomNavBarIcons[index],
                                applyTextScaling: true,
                                size: isTablet ? 35 : 25,
                                color: state.index == index
                                    ? navBarColors[index]
                                    : NColors.darkGrey,
                              )
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              body: pages[state.index],
            );
          },
        ),
      ),
    );
  }
}
