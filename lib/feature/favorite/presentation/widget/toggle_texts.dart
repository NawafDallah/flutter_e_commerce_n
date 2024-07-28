import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/edit_btn_cubit/edit_btn_clicked_cubit.dart';

class ToggleTrailingTexts extends StatelessWidget {
  const ToggleTrailingTexts({
    super.key,
    required this.favoritProductSet,
    required this.isClicked,
  });

  final Set favoritProductSet;
  final bool isClicked;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 150),
      crossFadeState:
          isClicked ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      alignment: const AlignmentDirectional(1, 0.0),
      firstChild: GestureDetector(
        onTap: () {
          context.read<EditBtnClickedCubit>().isCicked();
        },
        child: Text(
          "edit".tr(context),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      secondChild: GestureDetector(
        onTap: () {
          context.read<EditBtnClickedCubit>().isCicked();
          favoritProductSet.clear();
        },
        child: Text(
          "done".tr(context),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
