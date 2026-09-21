import 'package:flutter/material.dart';

import '../constants/app_strings.dart';
import '../theme/app_text_styles.dart';
class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final bool isObscure;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  const AppTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.isObscure = false,
    this.validator,
    this.suffixIcon,
    this.onChanged,
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      style: AppTextStyles.inputText,
      keyboardType: keyboardType,
      obscureText: isObscure,

      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }
}
