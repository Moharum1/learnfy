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
        elevation: 0.0,
        backgroundColor: AppColors.primary90,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.black5,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: AppColors.black10, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: AppColors.black10, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary90, width: 2.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
  );
}
