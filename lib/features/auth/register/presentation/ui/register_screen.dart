import 'package:evently/core/constants/app_strings.dart';
import 'package:evently/core/theme/app_spacing.dart';
import 'package:evently/core/theme/app_text_styles.dart';
import 'package:evently/core/widgets/app_button.dart';
import 'package:evently/features/auth/register/presentation/cubit/register_cubit.dart';
import 'package:evently/features/auth/register/presentation/cubit/register_state.dart';
import 'package:evently/features/auth/widgets/auth_footer_action.dart';
import 'package:evently/features/auth/widgets/auth_logo_header.dart';
import 'package:flutter/material.dart';

import 'package:evently/core/widgets/app_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/password_strength_indicator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.status == Status.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message ?? AppStrings.fbRegisterSuccess),
            ),
          );
        }
        if (state.status == Status.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message ?? AppStrings.fbRegisterErrorMsg),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.lg,
              ),

              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthLogoHeader(),
                    SizedBox(height: AppSpacing.lg),

                    /// -- HEADING
                    Text(
                      AppStrings.createAccount,
                      style: AppTextStyles.heading,
                    ),

                    SizedBox(height: AppSpacing.xs),

                    /// -- SUBTITLE
                    Text(
                      AppStrings.signUpSubtitle,
                      style: AppTextStyles.subtitle,
                    ),

                    /// -- FULL NAME
                    SizedBox(height: AppSpacing.xl),
                    Text(AppStrings.fullName, style: AppTextStyles.label),
                    SizedBox(height: AppSpacing.xs),
                    AppTextFormField(
                      controller: nameController,
                      hintText: AppStrings.nameHintTxt,
                      prefixIcon: Icons.person_outline,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppStrings.nameValidator;
                        }
                        return null;
                      },
                    ),

                    /// -- EMAIL
                    SizedBox(height: AppSpacing.lg),
                    Text(AppStrings.email, style: AppTextStyles.label),
                    SizedBox(height: AppSpacing.xs),
                    AppTextFormField(
                      controller: emailController,
                      hintText: AppStrings.emailHintTxt,
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppStrings.emailValidator;
                        }

                        if (!value.contains('@') || !value.contains('.')) {
                          return AppStrings.invalidEmailValidator;
                        }
                        return null;
                      },
                    ),

                    /// -- PASSWORD
                    SizedBox(height: AppSpacing.lg),
                    Text(AppStrings.password, style: AppTextStyles.label),
                    SizedBox(height: AppSpacing.xs),
                    AppTextFormField(
                      controller: passwordController,
                      hintText: AppStrings.passwordHintTxt,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                      isObscure: obscurePassword,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppStrings.passwordRequiredValidator;
                        }
                        if (value.length < 8) {
                          return AppStrings.passwordValidator;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    if (passwordController.text.isNotEmpty) ...[
                      const SizedBox(height: AppSpacing.xs),
                      PasswordStrengthIndicator(
                        password: passwordController.text,
                      ),
                    ],

                    /// -- CONFIRM PASSWORD
                    SizedBox(height: AppSpacing.lg),
                    Text(
                      AppStrings.confirmPassword,
                      style: AppTextStyles.label,
                    ),
                    SizedBox(height: AppSpacing.xs),

                    AppTextFormField(
                      controller: confirmPasswordController,
                      hintText: AppStrings.confirmPasswordHintTxt,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureConfirmPassword = !obscureConfirmPassword;
                          });
                        },
                        icon: Icon(
                          obscureConfirmPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                      isObscure: obscureConfirmPassword,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppStrings.confirmPasswordValidator;
                        }
                        if (value != passwordController.text) {
                          return AppStrings.passwordsDoNotMatchValidator;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: AppSpacing.xl),

                    /// -- CREATE ACCOUNT BUTTON
                    AppButton(
                      btnText: AppStrings.createAccountButton,
                      isLoading: state.status == Status.loading,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<RegisterCubit>().register(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passwordController.text,
                          );
                        }
                      },
                    ),

                    SizedBox(height: AppSpacing.lg),

                    /// -- AUTH FOOTER
                    AuthFooterAction(
                      text: AppStrings.alreadyHaveAccount,
                      actionText: AppStrings.signIn,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
