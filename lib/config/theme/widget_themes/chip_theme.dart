import 'package:flutter/material.dart';
import '../../../common/utils/constants/colors.dart';

class NChipTheme {
 const NChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: NColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: NColors.black),
    selectedColor: NColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: NColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: NColors.darkerGrey,
    labelStyle: TextStyle(color: NColors.white),
    selectedColor: NColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: NColors.white,
  );
}
