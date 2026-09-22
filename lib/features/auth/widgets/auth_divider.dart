import 'package:evently/core/constants/app_strings.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/theme/app_spacing.dart';
import 'package:evently/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(
          color: AppColors.surface,
        )),
        const SizedBox(width: AppSpacing.sm,),
        Text(AppStrings.or, style: AppTextStyles.subtitle,),
        const SizedBox(width: AppSpacing.sm,),
        const Expanded(child: Divider(color: AppColors.surface,)),
      ],
    );
  }
}
