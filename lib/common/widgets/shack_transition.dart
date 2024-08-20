import 'package:flutter/material.dart';

class ShakeTransition extends StatelessWidget {
  final Duration duration;
  final double deltaX;
  final double deltaY;
  final Widget child;
  final Curve curve;

  const ShakeTransition({
    super.key,
    this.duration = const Duration(milliseconds: 500),
    this.deltaX = 0.0,
    this.deltaY = 0.0,
    this.curve = Curves.easeInOutBack,
    required this.child,
  });

  /// convert 0-1 to 0-1-0
  double shake(double animation) =>
      2 * (0.2 - (0.8 - curve.transform(animation)).abs());

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      key: key,
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      builder: (context, animation, child) => Transform.translate(
        offset: Offset(deltaX * shake(animation), deltaY * shake(animation)),
        child: child,
      ),
      child: child,
    );
  }
}
