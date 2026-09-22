import 'package:evently/core/constants/images_strings.dart';
import 'package:flutter/material.dart';

import 'package:evently/core/theme/app_colors.dart';

class AppLogoContainer extends StatelessWidget {
  final double size;

  const AppLogoContainer({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFA855F7), AppColors.primary, AppColors.secondary],
        ),
        borderRadius: BorderRadius.circular(size * 0.30),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.45),
            blurRadius: size * 0.6,
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          ImagesStrings.appLogo,
          width: size * 0.525,
          height: size * 0.525,
        ),
      ),
    );
  }
}
