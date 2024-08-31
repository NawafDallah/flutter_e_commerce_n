import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';

import '../../../../../common/utils/constants/sizes.dart';
import '../home/search_capertino.dart';
import '../home/section_title.dart';
import 'brand_container.dart';

class SpaceAppBarBackground extends StatelessWidget {
  const SpaceAppBarBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomScrollView(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          // SPACE
          const SliverToBoxAdapter(
            child: SizedBox(height: kToolbarHeight * 1.5),
          ),

          // SEARCH BAR AS IOS STYLE
          const SliverToBoxAdapter(child: SearchBarCupertino()),

          // SPACE
          const SliverToBoxAdapter(
            child: SizedBox(height: NSizes.spaceBtwItems),
          ),

          // THE TITLE OF THE GRID SECTION
          SliverToBoxAdapter(
            child: SectionTitle(
              title: "brand".tr(context),
              padding: 0.0,
            ),
          ),

          // SPACE
          const SliverToBoxAdapter(
            child: SizedBox(height: NSizes.spaceBtwItems),
          ),

          // THE BRAND GRID VIEW
          SliverGrid.builder(
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 32.0,
              mainAxisExtent: 80,
            ),
            itemBuilder: (context, index) {
              return const BrandContainer();
            },
          ),
        ],
      ),
    );
  }
}
