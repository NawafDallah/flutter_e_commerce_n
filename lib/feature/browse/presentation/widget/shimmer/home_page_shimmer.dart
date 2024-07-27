import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/shimmer_container.dart';

class ShimmerHomePage extends StatelessWidget {
  const ShimmerHomePage({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    return SafeArea(
      child: SingleChildScrollView(
        controller: _scrollController,
        physics: const RangeMaintainingScrollPhysics(),
        child: Shimmer.fromColors(
          baseColor: isDark ? Colors.white12 : Colors.grey.shade300,
          highlightColor: isDark ? Colors.white54 : Colors.grey.shade100,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerContainer(
                      height: NSizes.ms,
                      width: NFunctions.screenWidth(context) * 0.25,
                      radius: NSizes.borderRadiusMd,
                    ),
                    const SizedBox(height: NSizes.ms),
                    const ShimmerContainer(
                      height: NSizes.ms,
                      radius: NSizes.borderRadiusMd,
                    ),
                    const SizedBox(height: NSizes.ms),
                    const ShimmerContainer(
                      height: NSizes.xl,
                      radius: NSizes.borderRadiusMd,
                    ),
                    const SizedBox(height: NSizes.xl),
                    ShimmerContainer(
                      height: NSizes.md,
                      radius: NSizes.borderRadiusMd,
                      width: NFunctions.screenWidth(context) * 0.66,
                    ),
                    const SizedBox(height: NSizes.sm),
                    ShimmerContainer(
                      height: NSizes.md,
                      radius: NSizes.borderRadiusMd,
                      width: NFunctions.screenWidth(context) * 0.77,
                    ),
                    const SizedBox(height: NSizes.xl),
                    // categories shimmer
                    const Row(
                      children: [
                        Expanded(
                          child: ShimmerContainer(
                            height: NSizes.cradVerticallHeight / 2,
                            radius: NSizes.borderRadiusMd,
                          ),
                        ),
                        SizedBox(width: NSizes.lg),
                        Expanded(
                          child: ShimmerContainer(
                            height: NSizes.cradVerticallHeight / 2,
                            radius: NSizes.borderRadiusMd,
                          ),
                        ),
                        SizedBox(width: NSizes.lg),
                        Expanded(
                          child: ShimmerContainer(
                            height: NSizes.cradVerticallHeight / 2,
                            radius: NSizes.borderRadiusMd,
                          ),
                        ),
                        SizedBox(width: NSizes.lg),
                        Expanded(
                          child: ShimmerContainer(
                            height: NSizes.cradVerticallHeight / 2,
                            radius: NSizes.borderRadiusMd,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: NSizes.md),
                    const Divider(),
                    const SizedBox(height: NSizes.md),
                    // banner shimmer
                    const Row(
                      children: [
                        ShimmerContainer(
                          height: NSizes.cradVerticallHeight / 1.5,
                          width: NSizes.cradHorizontalWidth * 0.95,
                          radius: NSizes.borderRadiusMd,
                        ),
                        SizedBox(width: NSizes.lg),
                        Expanded(
                          child: ShimmerContainer(
                            height: NSizes.cradVerticallHeight / 1.5,
                            radius: NSizes.borderRadiusMd,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: NSizes.md),
                    const Divider(),
                    const SizedBox(height: NSizes.md),
                    // featured shimmer
                    const Row(
                      children: [
                        ShimmerContainer(
                          height: NSizes.cradVerticallHeight / 3,
                          width: NSizes.cradHorizontalWidth * 0.8,
                          radius: NSizes.borderRadiusMd,
                        ),
                        SizedBox(width: NSizes.lg),
                        Expanded(
                          child: ShimmerContainer(
                            height: NSizes.cradVerticallHeight / 3,
                            radius: NSizes.borderRadiusMd,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: NSizes.md),
                    const Divider(),
                    const SizedBox(height: NSizes.md),
                    const Column(
                      children: [
                        //populer shimmer
                        Row(
                          children: [
                            Expanded(
                              child: ShimmerContainer(
                                height: NSizes.cradVerticallHeight * 0.8,
                                width: NSizes.cradHorizontalWidth * 0.8,
                                radius: NSizes.borderRadiusMd,
                              ),
                            ),
                            SizedBox(width: NSizes.lg),
                            Expanded(
                              child: ShimmerContainer(
                                height: NSizes.cradVerticallHeight * 0.8,
                                radius: NSizes.borderRadiusMd,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: NSizes.lg),
                        Row(
                          children: [
                            Expanded(
                              child: ShimmerContainer(
                                height: NSizes.cradVerticallHeight * 0.8,
                                width: NSizes.cradHorizontalWidth * 0.8,
                                radius: NSizes.borderRadiusMd,
                              ),
                            ),
                            SizedBox(width: NSizes.lg),
                            Expanded(
                              child: ShimmerContainer(
                                height: NSizes.cradVerticallHeight * 0.8,
                                radius: NSizes.borderRadiusMd,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
