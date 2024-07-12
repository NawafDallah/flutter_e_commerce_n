import 'package:flutter/material.dart';

import '../../../../../common/widgets/responsive.dart';
import '../../../../../config/routes/routes.dart';
import 'catigory_card.dart';

class Catigories extends StatelessWidget {
  const Catigories({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return SliverGrid.builder(
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisExtent: isTablet ? 150.0 : 100.0,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.catigory, arguments: index);
        },
        child: const CatigoryCard(),
      ),
    );
  }
}
