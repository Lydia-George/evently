import 'package:evently/core/constants/app_strings.dart';
import 'package:evently/core/routes/app_routes.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/theme/app_text_styles.dart';
import 'package:evently/core/widgets/app_logo_container.dart';
import 'package:evently/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:evently/features/auth/presentation/cubit/auth_state.dart';
import 'package:evently/features/splash/presentation/widgets/glow_orb.dart';
import 'package:evently/features/splash/presentation/widgets/splash_loading_dots.dart';
import 'package:evently/features/splash/presentation/widgets/splash_fade_in_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        }
        else if (state.status == AuthStatus.unauthenticated) {
          Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            /// -- BACKGROUND
            Positioned.fill(child: ColoredBox(color: AppColors.background)),

            /// -- CENTER PURPLE GLOW
            Align(
              alignment: Alignment.center,
              child: GlowOrb(
                size: 288,
                color: Color(0xFF7E22CE),
                opacity: 0.18,
                blur: 90,
              ),
            ),

            /// -- TOP LEFT INDIGO GLOW
            Positioned(
              top: 180,
              left: 40,
              child: GlowOrb(
                size: 160,
                color: Color(0xFF4F46E5),
                opacity: 0.12,
                blur: 70,
              ),
            ),

            /// -- BOTTOM RIGHT VIOLET GLOW
            Positioned(
              bottom: 180,
              right: 40,
              child: GlowOrb(
                size: 128,
                color: Color(0xFF8B5CF6),
                opacity: 0.10,
                blur: 60,
              ),
            ),

            /// -- SPLASH CONTENT
            Center(
              child: SplashFadeInUp(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const AppLogoContainer(size: 80),
                    SizedBox(height: 16),
                    Text(AppStrings.appName, style: AppTextStyles.heading),
                    SizedBox(height: 4),
                    Text(AppStrings.splashTxt, style: AppTextStyles.subtitle),
                    const SizedBox(height: 24),
                    SplashLoadingDots(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
