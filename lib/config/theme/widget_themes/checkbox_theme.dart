import 'package:flutter/material.dart';
import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/sizes.dart';

/// Custom Class for Light & Dark Text Themes
class NCheckboxTheme {
 const NCheckboxTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(NSizes.xs)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return NColors.white;
      } else {
        return NColors.black;
      }
    }), 
    fillColor: WidgetStateProperty .resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return NColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );

  /// Customizable Dark Text Theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(NSizes.xs)),
    checkColor: WidgetStateProperty .resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return NColors.white;
      } else {
        return NColors.black;
      }
    }),
    fillColor: WidgetStateProperty .resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return NColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
