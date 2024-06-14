import 'package:flutter/material.dart';

import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/sizes.dart';


class NAppBarTheme{
  const NAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: NColors.black, size: NSizes.iconMd),
    actionsIconTheme: IconThemeData(color: NColors.black, size: NSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: NColors.black),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: NColors.black, size: NSizes.iconMd),
    actionsIconTheme: IconThemeData(color: NColors.white, size: NSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: NColors.white),
  );
}