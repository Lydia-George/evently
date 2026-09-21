import 'package:flutter/material.dart';

import 'app_colors.dart';


class AppTextStyles {
  AppTextStyles._();

  static const TextStyle heading = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 30,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle subtitle = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle label = TextStyle(
    color: AppColors.label,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle inputText = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle hintText = TextStyle(
    color: AppColors.hint,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle buttonText = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

  static const linkText = TextStyle(
    color: AppColors.primary,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

}