import 'package:flutter/material.dart';

class StackedCircleAvatar extends StatelessWidget {
  const StackedCircleAvatar({
    super.key,
    required this.index,
    required this.isVertical,
    this.isClicked = false,
  });

  final int index;
  final bool isVertical;
  final bool isClicked;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: isVertical ? 10 + (index * 20) : 100 + (index * 20),
      bottom: isVertical ? -15.0 : -10.0,
      child: AnimatedOpacity(
        opacity: isClicked ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Center(
          child: CircleAvatar(
            radius: isVertical ? 17 : 18,
            backgroundColor: Colors.red[index * 100],
          ),
        ),
      ),
    );
  }
}
