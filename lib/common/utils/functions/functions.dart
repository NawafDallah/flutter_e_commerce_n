import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NFunctions {
  NFunctions._();

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message)),
      );
  }

  static void showAlertDialog(
      BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static bool isLightMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  static bool isArabic(BuildContext context) {
    return Localizations.localeOf(context).languageCode == 'ar';
  }

  static bool isEnglish(BuildContext context) {
    return Localizations.localeOf(context).languageCode == 'en';
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }
}
