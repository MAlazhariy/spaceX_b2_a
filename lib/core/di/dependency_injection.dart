import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

abstract class DI {
  static Future<void> init() async {
    // base
    // sl.registerLazySingleton<ApiClient<Response>>(() => DioClient(sl(), sharedPreferences: sl(), authenticationStatusRepo: sl(), appInterceptor: sl()));

    // data source
    // sl.registerLazySingleton<BaseAuthLocalDataSource>(() => AuthLocalDataSource(sl()));

    // repository
    // sl.registerLazySingleton<BaseAuthRepo>(() => AuthRepo(sl()));

    // controller
    // sl.registerFactory(() => AuthBloc(sl(), sl()));

    // External
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton<Dio>(() => Dio());
    // sl.registerLazySingleton(() => AppInterceptor(sl(), sl()));
    // sl.registerLazySingleton(() => LoggingInterceptor());
  }
}
