import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/theme/app_radius.dart';
import 'package:evently/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  final String text;
  final Widget leading;
  final VoidCallback onPressed;

  const SocialAuthButton({
    super.key,
    required this.text,
    required this.leading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            side: const BorderSide(
              color: AppColors.surface,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.large),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leading,
          const SizedBox(width: 10,),
          Text(text, style: AppTextStyles.label,),
        ],
      )),
    );
  }
}
