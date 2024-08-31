import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce_n_1/common/utils/constants/sizes.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter_e_commerce_n_1/common/utils/functions/functions.dart';

import '../../../../../common/utils/constants/colors.dart';

class SearchBarCupertino extends StatelessWidget {
  const SearchBarCupertino({
    super.key,
    this.autoFocus = false,
    this.enabled = false,
    this.onTap,
    this.onChanged,
    this.textEditingController,
    this.onSubmitted,
    this.focusNode,
  });
  final bool autoFocus;
  final bool enabled;
  final FocusNode? focusNode; 
  final TextEditingController? textEditingController;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    return CupertinoSearchTextField(
      focusNode: focusNode,
      placeholder: "searchByProductName".tr(context),
      onSubmitted: onSubmitted,
      controller: textEditingController,
      autofocus: autoFocus,
      enabled: enabled,
      itemColor: CupertinoColors.systemGrey,
      onTap: onTap,
      onChanged: onChanged,
      style: TextStyle(color: isDark? NColors.light: NColors.dark),
      decoration: BoxDecoration(
        color: !isDark ? CupertinoColors.systemGrey6 : null,
        borderRadius: BorderRadius.circular(NSizes.borderRadiusSm),
        border: const Border(
          bottom: BorderSide(color: NColors.primary),
        ),
      ),
    );
  }
}
