import 'package:flutter/material.dart';
import 'package:learnfy/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary90,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    ),
  );
}
