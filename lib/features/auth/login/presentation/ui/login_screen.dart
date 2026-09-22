import 'package:evently/core/constants/app_strings.dart';
import 'package:evently/core/constants/images_strings.dart';
import 'package:evently/core/routes/app_routes.dart';
import 'package:evently/core/theme/app_spacing.dart';
import 'package:evently/core/theme/app_text_styles.dart';
import 'package:evently/core/widgets/app_button.dart';
import 'package:evently/core/widgets/app_text_form_field.dart';
import 'package:evently/features/auth/widgets/auth_divider.dart';
import 'package:evently/features/auth/widgets/auth_footer_action.dart';
import 'package:evently/features/auth/widgets/social_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:evently/features/auth/widgets/auth_logo_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.lg,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - (AppSpacing.lg * 2),
                ),
                child: IntrinsicHeight(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// -- LOGO HEADER
                        const AuthLogoHeader(),

                        const SizedBox(height: AppSpacing.xl),

                        /// -- HEADING
                        Text(AppStrings.welcomeBack, style: AppTextStyles.heading),
                        const SizedBox(height: AppSpacing.xs),

                        /// -- SUBTITLE
                        Text(
                          AppStrings.loginSubtitle,
                          style: AppTextStyles.subtitle,
                        ),

                        const SizedBox(height: AppSpacing.xl),

                        /// -- EMAIL
                        Text(AppStrings.email, style: AppTextStyles.label),
                        const SizedBox(height: AppSpacing.xs),
                        AppTextFormField(
                          controller: emailController,
                          hintText: AppStrings.emailHintTxt,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.password, style: AppTextStyles.label),
                            TextButton(
                              onPressed: () {
                                // TODO: Forgot Password
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                AppStrings.forgotPassword,
                                style: AppTextStyles.linkText,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSpacing.xs),

                        AppTextFormField(
                          controller: passwordController,
                          hintText: AppStrings.loginPasswordHintTxt,
                          isObscure: obscurePassword,
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
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return AppStrings.passwordRequiredValidator;
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: AppSpacing.xxl),

                        const Spacer(),

                        /// -- SIGN IN BUTTON
                        AppButton(
                          btnText: AppStrings.signInButton,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              // TODO: Logic later
                            }
                          },
                        ),

                        const SizedBox(height: AppSpacing.lg),

                        /// -- DIVIDER
                        const AuthDivider(),

                        const SizedBox(height: AppSpacing.lg),

                        /// -- GOOGLE BUTTON
                        SocialAuthButton(
                          text: AppStrings.continueWithGoogle,
                          leading: Image.asset(
                            ImagesStrings.googleIcon,
                            width: 20,
                            height: 20,
                          ),
                          onPressed: () {},
                        ),

                        const SizedBox(height: AppSpacing.sm),

                        /// -- AUTH FOOTER
                        AuthFooterAction(
                          text: AppStrings.dontHaveAccount,
                          actionText: AppStrings.signUp,
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.registerScreen,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
