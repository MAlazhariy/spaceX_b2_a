import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex/features/dashboard/view/cubit/dashboard_cubit.dart';
import 'package:spacex/features/rocket/rockets_api_service.dart';
import 'package:spacex/core/network/api/api_client.dart';
import 'package:spacex/core/network/api/dio_client.dart';
import 'package:spacex/core/network/api/interceptor/app_interceptor.dart';
import 'package:spacex/core/network/api/interceptor/logging_interceptor.dart';
import 'package:spacex/features/rocket/data/repository/rockets_repository.dart';
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
    sl.registerLazySingleton<RocketsApiService>(() => RocketsApiService(sl()));
    sl.registerLazySingleton<RocketsRepository>(() => RocketsRepository(sl()));

    // controller
    sl.registerFactory(() => DashboardCubit());
    // sl.registerFactory(() => HomeBloc());
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
