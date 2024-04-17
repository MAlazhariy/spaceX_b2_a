import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    rocketsReposetory = RocketsReposetory(RocketsApiServes(sl<ApiClient<Response>>()));

    rocketsCubit = RocketsCubit(rocketsReposetory);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => rocketsCubit,
            child:    RocketsScreen(),

          ),
        );
    }
  }
}
