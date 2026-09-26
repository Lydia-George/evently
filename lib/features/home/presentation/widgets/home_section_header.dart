import 'package:evently/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
class HomeSectionHeader extends StatelessWidget {
  final String title;

  const HomeSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),),
        TextButton(onPressed: (){}, child: Text('See all', style: TextStyle(
          color: AppColors.primary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),))
      ],
    );
  }
}
