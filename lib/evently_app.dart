import 'package:evently/core/routes/app_router.dart';
import 'package:evently/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:AppRoutes.registerScreen ,
      onGenerateRoute: AppRouter.onGenerateRoutes,
    );
  }
}
