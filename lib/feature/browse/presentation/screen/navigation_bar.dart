import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/functions/functions.dart';
import '../bloc/nav_bar_index/nav_bar_index_cubit.dart';
import 'home.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    List pages = [
      const Home(),
      Container(color: Colors.amber),
      Container(color: Colors.green),
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
      child: BlocProvider(
        create: (context) => NavBarIndexCubit(),
        child: BlocBuilder<NavBarIndexCubit, SelectedIndex>(
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              extendBody: true,
              bottomNavigationBar: Container(
                clipBehavior: Clip.antiAlias,
                padding: const EdgeInsets.only(
                    left: 32.0, right: 32.0, bottom: 24.0),
                decoration: BoxDecoration(
                    color: isDark
                        ? NColors.black.withOpacity(0.80)
                        : NColors.white.withOpacity(0.8),
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20.0))),
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
                                width: state.index == index ? 25.0 : 0.0,
                                margin: const EdgeInsets.only(bottom: 8.0),
                                decoration: BoxDecoration(
                                    color: navBarColors[index],
                                    borderRadius: BorderRadius.circular(12.0),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 25,
                                        spreadRadius: 15,
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
                                size: 25,
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
