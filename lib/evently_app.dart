import 'package:evently/core/di/service_locator.dart';
import 'package:evently/core/routes/app_router.dart';
import 'package:evently/core/routes/app_routes.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/features/auth/data/repo/auth_repo.dart';
import 'package:evently/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      lazy: false,
      create: (_) => AuthCubit(getIt<AuthRepo>()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splashScreen,
        onGenerateRoute: AppRouter.onGenerateRoutes,
        theme: AppTheme.darkTheme,
      ),
    );
  }
}
