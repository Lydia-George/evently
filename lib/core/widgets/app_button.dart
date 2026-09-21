import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/theme/app_radius.dart';
import 'package:evently/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressed;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.btnText,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
        ),
        borderRadius: BorderRadius.circular(AppRadius.large),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.45),
            offset: Offset(0, 4),
            blurRadius: 28,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.large),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(btnText, style: AppTextStyles.buttonText),
      ),
    );
  }
}
