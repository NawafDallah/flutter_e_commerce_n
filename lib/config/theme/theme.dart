import 'package:flutter/material.dart';
import '../../common/utils/constants/colors.dart';
import 'widget_themes/appbar_theme.dart';
import 'widget_themes/bottom_sheet_theme.dart';
import 'widget_themes/checkbox_theme.dart';
import 'widget_themes/chip_theme.dart';
import 'widget_themes/elevated_button_theme.dart';
import 'widget_themes/outlined_button_theme.dart';
import 'widget_themes/text_field_theme.dart';
import 'widget_themes/text_theme.dart';

class NAppTheme {
  const NAppTheme._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    disabledColor: NColors.grey,
    brightness: Brightness.light,
    primaryColor: NColors.primary,
    textTheme: NTextTheme.lightTextTheme,
    chipTheme: NChipTheme.lightChipTheme,
    scaffoldBackgroundColor: NColors.white,
    appBarTheme: NAppBarTheme.lightAppBarTheme,
    checkboxTheme: NCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: NBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: NElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: NOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: NTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    disabledColor: NColors.grey,
    brightness: Brightness.dark,
    primaryColor: NColors.primary,
    textTheme: NTextTheme.darkTextTheme,
    chipTheme: NChipTheme.darkChipTheme,
    scaffoldBackgroundColor: NColors.black, 
    appBarTheme: NAppBarTheme.darkAppBarTheme,
    checkboxTheme: NCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: NBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: NElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: NOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: NTextFormFieldTheme.darkInputDecorationTheme,
  );
}
