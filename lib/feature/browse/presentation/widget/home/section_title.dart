import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.padding,
  });

  final String title;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge!.copyWith(
        fontSize: 24
      )),
    );
  }
}
