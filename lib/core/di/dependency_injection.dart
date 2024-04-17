import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex/core/network/api/Rockets_ApiServes.dart';
import 'package:spacex/core/network/api/api_client.dart';
import 'package:spacex/core/network/api/dio_client.dart';
import 'package:spacex/core/network/api/interceptor/app_interceptor.dart';
import 'package:spacex/core/network/api/interceptor/logging_interceptor.dart';
import 'package:spacex/core/network/repositery/RocketsReposetory.dart';
import 'package:spacex/features/launches/data/data_source/launch_remote_data_source.dart';
import 'package:spacex/features/launches/data/repository/launch_repository.dart';
import 'package:spacex/features/launches/logic/launch_bloc.dart';
import 'package:spacex/features/rocket/logic/rockets_cubit.dart';

final sl = GetIt.instance;

abstract class DI {
  static Future<void> init() async {
    // base
    sl.registerLazySingleton<ApiClient<Response>>(() => DioClient(sl(), sharedPreferences: sl(), appInterceptor: sl()));

    // data source
    sl.registerLazySingleton<BaseLaunchRemoteDataSource>(() => LaunchRemoteDataSource(sl()));

    // repository
    sl.registerLazySingleton<BaseLaunchRepository>(() => LaunchRepository(sl()));

    // custom
    sl.registerLazySingleton<RocketsApiServes>(() => RocketsApiServes(sl()));
    sl.registerLazySingleton<RocketsReposetory>(() => RocketsReposetory(sl()));

    // controller
    /* todo: add controllers */
    // sl.registerFactory(() => HomeBloc());
    // sl.registerFactory(() => LaunchBloc());
    // sl.registerFactory(() => RocketBloc());
    sl.registerFactory(() => RocketsCubit(sl()));
    sl.registerFactory(() => LaunchBloc(sl()));

    // External
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton<Dio>(() => Dio());
    sl.registerLazySingleton(() => AppInterceptor());
    sl.registerLazySingleton(() => LoggingInterceptor());
  }
}
