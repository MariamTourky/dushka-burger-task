import 'package:flutter/material.dart';
import 'package:trust_develpoment/app/core/ui_helper/color/colors.dart';
import 'package:trust_develpoment/app/core/ui_helper/style/font_style.dart';


class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.appBackground,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryRed,
      primary: AppColors.primaryRed,
      error: AppColors.error,
    ),

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appBackground,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.textPrimary),
      titleTextStyle: AppTextStyles.headlineMedium,
    ),

    // Cards
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryRed,
        foregroundColor: Colors.white,
        textStyle: AppTextStyles.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),

    // Bottom Navigation
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.bottomNavSelected,
      unselectedItemColor: AppColors.black,
      backgroundColor: AppColors.surface,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: const TextStyle(color: AppColors.textSecondary),
      hintStyle: const TextStyle(color: AppColors.textSecondary),
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      filled: true,
      fillColor: Colors.white,
      errorStyle: const TextStyle(color: AppColors.error, height: 1.3),
      enabledBorder: _border(AppColors.primaryRed),
      focusedBorder: _border(AppColors.primaryRed),
      errorBorder: _border(Colors.red),
      focusedErrorBorder: _border(Colors.red),
    ),
    // Dividers
    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
    ),

    // Text
    textTheme: const TextTheme(
      headlineLarge: AppTextStyles.headlineLarge,
      headlineMedium: AppTextStyles.headlineMedium,
      titleMedium: AppTextStyles.title,
      bodyMedium: AppTextStyles.body,
      bodySmall: AppTextStyles.caption,
    ),
  );

  static OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: color, width: 1.2),
    );
  }
}