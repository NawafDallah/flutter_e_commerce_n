import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/responsive.dart';
import '../../../../../config/routes/routes.dart';
import '../../../domain/entity/catigory_entity.dart';
import 'catigory_card.dart';

class Catigories extends StatelessWidget {
  const Catigories({
    super.key,
    required this.homeFetchedNotifier,
    required this.catigories,
  });

  final bool homeFetchedNotifier;
  final List<CatigoryEntity> catigories;

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return AnimationLimiter(
      child: SliverGrid.builder(
          itemCount: catigories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisExtent: isTablet ? 150.0 : 100.0,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.catigory,
                  arguments: {
                    'index': index,
                    'categories': catigories,
                  },
                );
              },
              child: homeFetchedNotifier
                  ? AnimationConfiguration.staggeredGrid(
                      position: 0,
                      columnCount: 4,
                      child: SlideAnimation(
                        horizontalOffset: -150,
                        child: ScaleAnimation(
                          scale: 0,
                          duration: const Duration(milliseconds: 150),
                          child: FadeInAnimation(
                            duration: const Duration(milliseconds: 500),
                            child: CatigoryCard(
                              catigory: catigories[index],
                            ),
                          ),
                        ),
                      ),
                    )
                  : CatigoryCard(catigory: catigories[index]),
            );
          }),
    );
  }
}
