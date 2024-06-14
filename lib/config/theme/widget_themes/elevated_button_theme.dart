import 'package:flutter/material.dart';
import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class NElevatedButtonTheme {
 const  NElevatedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightElevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: NColors.light,
      backgroundColor: NColors.primary,
      disabledForegroundColor: NColors.darkGrey,
      disabledBackgroundColor: NColors.buttonDisabled,
      side: const BorderSide(color: NColors.primary),
      padding: const EdgeInsets.symmetric(vertical: NSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: NColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(NSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: NColors.light,
      backgroundColor: NColors.primary,
      disabledForegroundColor: NColors.darkGrey,
      disabledBackgroundColor: NColors.darkerGrey,
      side: const BorderSide(color: NColors.primary),
      padding: const EdgeInsets.symmetric(vertical: NSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: NColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(NSizes.buttonRadius)),
    ),
  );
}
