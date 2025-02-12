import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/app_config.dart';
import 'package:spacex/core/constants.dart';
import 'package:spacex/core/di/dependency_injection.dart';
import 'package:spacex/core/utils/common/bloc_observer.dart';
import 'package:spacex/core/utils/common/languages.dart';
import 'package:spacex/core/utils/common/system_overlay_style.dart';
import 'package:spacex/features/capsules/logic/capsule_bloc.dart';
import 'package:spacex/features/dashboard/view/cubit/dashboard_cubit.dart';
import 'package:spacex/features/home/logic/home_bloc.dart';
import 'package:spacex/features/launches/logic/launch_bloc.dart';
import 'package:spacex/my_app.dart';
import 'package:flutter/material.dart';

import 'features/rocket/logic/rockets_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    // init localization
    EasyLocalization.ensureInitialized(),
    // init Services locator (DI)
    DI.init(),
  ]);

  Bloc.observer = const MyBlocObserver();

  // set system app bar style
  SystemChrome.setSystemUIOverlayStyle(kSystemOverlayStyle);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  final appConfig = AppConfig(
    appEnvironment: AppEnvironment.dev,
    appName: 'SpaceX development',
    description: 'This is a development version of SpaceX app',
    baseUrl: AppConstants.BASE_URL,
    child: MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<DashboardCubit>()),
        BlocProvider(create: (_) => sl<HomeBloc>()),
        BlocProvider(create: (_) => sl<RocketsCubit>()),
        BlocProvider(create: (_) => sl<LaunchBloc>()..add(GetNextLaunchEvent())),
        BlocProvider(create: (_) => sl<CapsuleBloc>()..add(GetCapsulesEvent())),
      ],
      child: EasyLocalization(
        supportedLocales: Language.locales,
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    ),
  );

  runApp(appConfig);
}
