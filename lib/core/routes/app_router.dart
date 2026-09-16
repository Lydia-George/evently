import 'package:evently/features/auth/register/presentation/ui/register_screen.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';

class AppRouter {
static Route? onGenerateRoutes(RouteSettings settings){
  switch(settings.name){
    case AppRoutes.registerScreen:
      return MaterialPageRoute(builder: (_) => RegisterScreen());
  }
  }
}