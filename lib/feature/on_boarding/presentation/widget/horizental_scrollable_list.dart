import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_n_1/common/utils/constants/sizes.dart';
import 'image_container.dart';
import 'on_boarding_text.dart';

class HorizentalScrollablePage extends StatelessWidget {
  const HorizentalScrollablePage({
    super.key,
    required this.title,
    required this.content,
    required this.image,
    required this.value,
  });

  final String title;
  final String content;
  final String image;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const Spacer(),
          Expanded(
            flex: 3,
            child: ImageContainer(
              image: image,
              value: value,
            ),
          ),
          const SizedBox(height: NSizes.xl * 2),
          Expanded(
            flex: 3,
            child: OnBordingText(
              title: title,
              content: content,
              value: value,
            ),
          )
        ],
      ),
    );
  }
}
