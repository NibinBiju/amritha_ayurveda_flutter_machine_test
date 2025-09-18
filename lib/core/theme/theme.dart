import 'package:amritha_ayurveda/core/configs/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final appTheme = ThemeData(
    splashColor: Colors.transparent,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    hintColor: AppColors.grey,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.textColor,
    ),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(fontFamily: 'Poppins'),
      errorStyle: TextStyle(fontFamily: 'Poppins'),
      labelStyle: TextStyle(fontFamily: 'Poppins'),
      prefixStyle: TextStyle(fontFamily: 'Poppins'),
      filled: true,
      fillColor: AppColors.background,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: AppColors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: AppColors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: AppColors.grey),
      ),
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.background,
      contentTextStyle: const TextStyle(
        color: AppColors.primary,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 6,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.grey, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.iconColor),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.background,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    ),
  );
}
