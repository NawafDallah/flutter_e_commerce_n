import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';

import '../../../../../common/utils/constants/sizes.dart';
import '../../bloc/browse/search_product/search_product_bloc.dart';
import '../home/search_capertino.dart';

class AnimatedSearchBar extends StatelessWidget {
  const AnimatedSearchBar({
    super.key,
    required this.isFocusedNotifier,
    required this.searchFocusNode,
  });

  final ValueNotifier<bool> isFocusedNotifier;
  final FocusNode searchFocusNode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ValueListenableBuilder(
          valueListenable: isFocusedNotifier,
          builder: (_, isFocused, child) {
            return AnimatedPositionedDirectional(
              duration: const Duration(milliseconds: 250),
              end: isFocused ? NSizes.sm : -5 * NSizes.ms,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: isFocused ? 1.0 : 0.0,
                child: child,
              ),
            );
          },
          child: TextButton(
            onPressed: () {
              searchFocusNode.unfocus();
            },
            child: Text(
              "cancel".tr(context),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: isFocusedNotifier,
          builder: (_, isFocused, child) => AnimatedPadding(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsetsDirectional.only(
              start: NSizes.ms,
              end: isFocused ? NSizes.ms * 7 : NSizes.ms,
              top: NSizes.sm,
              bottom: NSizes.sm,
            ),
            child: child,
          ),
          child: SearchBarCupertino(
            enabled: true,
            focusNode: searchFocusNode,
            onChanged: (String text) {
              if (text.isNotEmpty) {
                context
                    .read<SearchProductBloc>()
                    .add(SearchForProductEvent(productName: text));
              } else {
                context
                    .read<SearchProductBloc>()
                    .add(const SearchProductInitialEvent());
              }
            },
          ),
        ),
      ],
    );
  }
}
