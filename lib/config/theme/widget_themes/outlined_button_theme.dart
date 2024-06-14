import 'package:flutter/material.dart';

import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class NOutlinedButtonTheme {
 const NOutlinedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme  = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: NColors.dark,
      side: const BorderSide(color: NColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: NColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: NSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(NSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: NColors.light,
      side: const BorderSide(color: NColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: NColors.textWhite, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: NSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(NSizes.buttonRadius)),
    ),
  );
}
