import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/theme/app_radius.dart';
import 'package:evently/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';


class AppTheme {
  AppTheme._();

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.background,

    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.surface,
      error: AppColors.error,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,

      hintStyle: AppTextStyles.hintText,

      prefixIconColor: AppColors.hint,

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.large),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.large),
        borderSide: BorderSide(
          color: AppColors.primary,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.large),
        borderSide: BorderSide(
          color: AppColors.error,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.large),
        borderSide: BorderSide(
          color: AppColors.error,
        ),
      ),

    )

  );
}