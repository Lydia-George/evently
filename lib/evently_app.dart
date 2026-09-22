import 'package:evently/core/routes/app_router.dart';
import 'package:evently/core/routes/app_routes.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:AppRoutes.splashScreen ,
      onGenerateRoute: AppRouter.onGenerateRoutes,
      theme: AppTheme.darkTheme,
    );
  }
}
