import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/utils/constants/colors.dart';

class NTextTheme {
 const NTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(

    headlineLarge: const TextStyle().copyWith(fontSize: 32.0.sp, fontWeight: FontWeight.bold, color: NColors.dark),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0.sp, fontWeight: FontWeight.w600, color: NColors.dark),
    headlineSmall: const TextStyle().copyWith(fontSize: 18.0.sp, fontWeight: FontWeight.w600, color: NColors.dark),
    
    
    titleLarge: const TextStyle().copyWith(fontSize: 16.0.sp, fontWeight: FontWeight.w600, color: NColors.dark),
    titleMedium: const TextStyle().copyWith(fontSize: 16.0.sp, fontWeight: FontWeight.w500, color: NColors.dark),
    titleSmall: const TextStyle().copyWith(fontSize: 16.0.sp, fontWeight: FontWeight.w400, color: NColors.dark),

    bodyLarge: const TextStyle().copyWith(fontSize: 14.0.sp, fontWeight: FontWeight.w500, color: NColors.dark),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0.sp, fontWeight: FontWeight.normal, color: NColors.dark),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0.sp, fontWeight: FontWeight.w500, color: NColors.dark.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(fontSize: 12.0.sp, fontWeight: FontWeight.normal, color: NColors.dark),
    labelMedium: const TextStyle().copyWith(fontSize: 12.0.sp, fontWeight: FontWeight.normal, color: NColors.dark.withOpacity(0.5)),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0.sp, fontWeight: FontWeight.bold, color: NColors.light),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0.sp, fontWeight: FontWeight.w600, color: NColors.light),
    headlineSmall: const TextStyle().copyWith(fontSize: 18.0.sp, fontWeight: FontWeight.w600, color: NColors.light),

    titleLarge: const TextStyle().copyWith(fontSize: 16.0.sp, fontWeight: FontWeight.w600, color: NColors.light),
    titleMedium: const TextStyle().copyWith(fontSize: 16.0.sp, fontWeight: FontWeight.w500, color: NColors.light),
    titleSmall: const TextStyle().copyWith(fontSize: 16.0.sp, fontWeight: FontWeight.w400, color: NColors.light),

    bodyLarge: const TextStyle().copyWith(fontSize: 14.0.sp, fontWeight: FontWeight.w500, color: NColors.light),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0.sp, fontWeight: FontWeight.normal, color: NColors.light),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0.sp, fontWeight: FontWeight.w500, color: NColors.light.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(fontSize: 12.0.sp, fontWeight: FontWeight.normal, color: NColors.light),
    labelMedium: const TextStyle().copyWith(fontSize: 12.0.sp, fontWeight: FontWeight.normal, color: NColors.light.withOpacity(0.5)),
  );
}
