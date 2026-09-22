import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_logo_container.dart';
class AuthLogoHeader extends StatelessWidget {
  const AuthLogoHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppLogoContainer(size: 32,),
        SizedBox(width: AppSpacing.xs,),
        Text(AppStrings.appName, style: AppTextStyles.buttonText,),
      ],);
  }
}