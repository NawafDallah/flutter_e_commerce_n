import 'package:flutter/material.dart';

import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/responsive.dart';
import '../widget/catigory/background_space_bar.dart';
import '../widget/catigory/catigories_tab_bar.dart';
import '../widget/my_sliver_appbar.dart';
import '../widget/product_card/product_vertical_card.dart';

class CatigoriesPage extends StatelessWidget {
  const CatigoriesPage({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return DefaultTabController(
      length: 8,
      initialIndex: index,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              const MySliverAppBar(
                backgroundSpaceBar: SpaceAppBarBackground(),
                tabBar: CatigoriesTabBar(),
              ),
            ];
          },
          body: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: List.generate(8, (index) {
              return Stack(
                children: [
                  GridView.builder(
                    itemCount: 6,
                    padding: const EdgeInsets.only(
                        left: 4.0,
                        right: 4.0,
                        bottom: kBottomNavigationBarHeight,
                        top: 16.0),
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isTablet ? 3 : 2,
                      mainAxisSpacing: NSizes.gridViewSpacing * 2,
                      mainAxisExtent: NSizes.cradVerticallHeight,
                    ),
                    itemBuilder: (context, index) {
                      return const ProductVerticalCard();
                    },
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
