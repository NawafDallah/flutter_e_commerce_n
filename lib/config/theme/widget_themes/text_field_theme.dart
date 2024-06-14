import 'package:flutter/material.dart';
import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/sizes.dart';

class NTextFormFieldTheme {
 const NTextFormFieldTheme._();

  // * Light Theme *//
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: NColors.darkGrey,
    suffixIconColor: NColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: NSizes.fontSizeMd, color: NColors.black),
    hintStyle: const TextStyle().copyWith(fontSize: NSizes.fontSizeMd, color: NColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    helperStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal, color: NColors.error),
    
    floatingLabelStyle: const TextStyle().copyWith(color: NColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(NSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: NColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(NSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: NColors.grey),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(NSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: NColors.primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(NSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: NColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(NSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: NColors.warning),
    ),
  );

  // * Dark Theme *//
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: NColors.darkGrey,
    suffixIconColor: NColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: NSizes.fontSizeMd, color: NColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: NSizes.fontSizeMd, color: NColors.white),
    helperStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal, color: NColors.error),
    floatingLabelStyle: const TextStyle().copyWith(color: NColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(NSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: NColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(NSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: NColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(NSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: NColors.primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(NSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: NColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(NSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: NColors.warning),
    ),
  );
}
