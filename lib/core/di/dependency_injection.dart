import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex/core/network/api/api_client.dart';
import 'package:spacex/core/network/api/dio_client.dart';
import 'package:spacex/core/network/api/interceptor/app_interceptor.dart';
import 'package:spacex/core/network/api/interceptor/logging_interceptor.dart';

final sl = GetIt.instance;

abstract class DI {
  static Future<void> init() async {
    // base
    sl.registerLazySingleton<ApiClient<Response>>(
        () => DioClient(sl(), sharedPreferences: sl(), appInterceptor: sl()));

    // data source
    // sl.registerLazySingleton<BaseAuthLocalDataSource>(() => AuthLocalDataSource(sl()));

    // repository
    // sl.registerLazySingleton<BaseAuthRepo>(() => AuthRepo(sl()));

    // controller
    /* todo: add controllers */
    // sl.registerFactory(() => HomeBloc());
    // sl.registerFactory(() => LaunchBloc());
    // sl.registerFactory(() => RocketBloc());

    // External
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton<Dio>(() => Dio());
    sl.registerLazySingleton(() => AppInterceptor());
    sl.registerLazySingleton(() => LoggingInterceptor());
  }
}
