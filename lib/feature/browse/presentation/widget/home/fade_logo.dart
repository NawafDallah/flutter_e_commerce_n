import 'package:flutter/material.dart';

import '../../../../../common/utils/functions/functions.dart';

class FadeLogo extends StatelessWidget {
  const FadeLogo({
    super.key,
    required ValueNotifier<double> logoNotifire,
  }) : _logoNotifire = logoNotifire;

  final ValueNotifier<double> _logoNotifire;

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    return Positioned(
      right: 0.0,
      left: 0.0,
      bottom: 0.0,
      child: ValueListenableBuilder(
        valueListenable: _logoNotifire,
        builder: (_, value, child) {
          return Opacity(
            opacity: value,
            child: child,
          );
        },
        child: Center(
          child: Image.asset(
            height: 180,
            isDark
                ? "assets/logos/n-store-splash-logo-dark.png"
                : "assets/logos/n-store-splash-logo-light.png",
          ),
        ),
      ),
    );
  }
}
