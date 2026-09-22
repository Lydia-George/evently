import 'package:evently/core/constants/app_strings.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/theme/app_radius.dart';
import 'package:evently/core/theme/app_spacing.dart';
import 'package:evently/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  final String password;

  const PasswordStrengthIndicator({super.key, required this.password});

  String get passwordStrengthText {
    if (password.length < 5) {
      return AppStrings.weakPassword;
    }

    if (password.length < 8) {
      return AppStrings.fairPassword;
    }

    return AppStrings.strongPassword;
  }

  int get strengthLevel {
    if (password.length < 5) {
      return 1;
    }
    if (password.length < 8) {
      return 2;
    }
    return 3;
  }

  Widget _strengthBar({required bool isActive}) {
    return Expanded(
      child: Container(
        height: 4,
        decoration: BoxDecoration(
          color: isActive ? AppColors.success : AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.small),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              _strengthBar(isActive: strengthLevel >= 1),
              SizedBox(width: 4),
              _strengthBar(isActive: strengthLevel >= 2),
              SizedBox(width: 4),
              _strengthBar(isActive: strengthLevel >= 3),
            ],
          ),
        ),
        SizedBox(width: AppSpacing.sm),
        Text(passwordStrengthText, style: AppTextStyles.subtitle),
      ],
    );
  }
}
