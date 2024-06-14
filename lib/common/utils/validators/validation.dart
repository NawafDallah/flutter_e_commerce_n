import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';

class NValidator {
  const NValidator._();

  static String? validateIsEmpty(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "thisfieldisrequired".tr(context);
    }
    return null;
  }

  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "thisfieldisrequired".tr(context);
    }
    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return "invalidemailaddress".tr(context);
    }
    return null;
  }

  static String? validateUserName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "thisfieldisrequired".tr(context);
    }

    // Check for minimum userName length
    if (value.length < 3) {
      return "usernamelength".tr(context);
    }
    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "thisfieldisrequired".tr(context);
    }
    // Check for minimum password length
    if (value.length < 6) {
      return "passwordlength".tr(context);
    }
    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "passworduppercaseletter".tr(context);
    }
    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "passwordonenumber".tr(context);
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "passwordspecialcharacter".tr(context);
    }
    return null;
  }

  static String? validatePhoneNumber(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "thisfieldisrequired".tr(context);
    }

    // Regular expression for phone number validation
    // (assuming a 10-digit KSA phone number format)
    final phoneRegExp10Digit = RegExp(r'^\d{10}$');

    if (!phoneRegExp10Digit.hasMatch(value)) {
      return "invalidphonenumber".tr(context);
    }
    // Regular expression for phone number validation
    // (start with 05)
    final phoneRegExpstart05 = RegExp(r'^05\d{8}$');
    if (!phoneRegExpstart05.hasMatch(value)) {
      return "muststartwith05".tr(context);
    }
    return null;
  }
}
