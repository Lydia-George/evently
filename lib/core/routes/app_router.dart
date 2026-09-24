import 'package:evently/core/di/service_locator.dart';
import 'package:evently/features/auth/login/data/repo/login_repo.dart';
import 'package:evently/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:evently/features/auth/login/presentation/ui/login_screen.dart';
import 'package:evently/features/auth/register/presentation/cubit/register_cubit.dart';
import 'package:evently/features/auth/register/presentation/ui/register_screen.dart';
import 'package:evently/features/home/presentation/ui/home_screen.dart';
import 'package:evently/features/splash/presentation/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_routes.dart';

class AppRouter {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(getIt()),
            child: const RegisterScreen(),
          ),
        );
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => LoginCubit(getIt<LoginRepo>()),
            child: const LoginScreen(),
          ),
        );
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(),
        );
    }
    return null;
  }
}
