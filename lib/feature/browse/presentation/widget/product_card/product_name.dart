import 'package:flutter/material.dart';

class ProductName extends StatelessWidget {
  const ProductName({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
