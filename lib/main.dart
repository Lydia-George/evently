import 'package:evently/core/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'evently_app.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await setupGetIt();
  runApp(const EventlyApp());
}

