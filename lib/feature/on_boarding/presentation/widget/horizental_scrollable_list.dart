import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          SizedBox(height: 50.h),
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
