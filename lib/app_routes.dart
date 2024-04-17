import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex/core/di/dependency_injection.dart';
import 'package:spacex/core/network/api/api_client.dart';

import 'core/network/api/Rockets_ApiServes.dart';
import 'core/network/repositery/RocketsReposetory.dart';
import 'features/rocket/logic/rockets_cubit.dart';
import 'features/rocket/view/screens/rockets_screen.dart';

class AppRouter {
  late RocketsReposetory rocketsReposetory;
  late RocketsCubit rocketsCubit;

  AppRouter() {
    rocketsReposetory = RocketsReposetory(
      RocketsApiServes(
        sl(),
      ),
    );

    rocketsCubit = RocketsCubit(rocketsReposetory);

    sl<RocketsCubit>();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => rocketsCubit,
            child: RocketsScreen(),
          ),
        );
    }
  }
}
