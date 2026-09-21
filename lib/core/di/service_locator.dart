import 'package:dio/dio.dart';
import 'package:evently/core/networking/dio_factory.dart';
import 'package:evently/features/auth/register/data/repo/register_repo.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  final Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo());
}
