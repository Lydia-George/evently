import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuthFooterAction extends StatelessWidget {
  final String text;
  final String actionText;
  final VoidCallback onPressed;

  const AuthFooterAction({
    super.key,
    required this.text,
    required this.actionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(onPressed: onPressed, child: Text.rich(TextSpan(
        text: text,
        style: AppTextStyles.subtitle,
        children: [
          TextSpan(text: actionText,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          )
          )
        ]
      ))),
    );
  }
}
