import 'package:flutter/material.dart';

import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/responsive.dart';
import 'catigory_card.dart';

class Catigories extends StatelessWidget {
  const Catigories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    final isSmallDevice = Responsive.isSmallMobile(context);
    return SizedBox(
      height: isSmallDevice
          ? NFunctions.screenHeight(context) * 0.33
          : NFunctions.screenHeight(context) * 0.25,
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 8,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisExtent: isTablet ? 150.0 : 100.0,
        ),
        itemBuilder: (context, index) => const CatigoryCard(),
      ),
    );
  }
}
