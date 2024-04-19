import 'package:connection_wrapper/connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/widgets/main/main_background.dart';
import 'package:spacex/core/widgets/no_internet_widget.dart';
import 'package:spacex/features/home/view/screens/home_view.dart';
import 'package:spacex/features/launches/logic/launch_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainGalaxyBackground(
        child: SafeArea(
          child: ConnectionWrapperWidget.builder(
            builder: (context, internetProvider) {
              if (internetProvider.noInternetConnection) {
                return const NoInternetWidget();
              }

              return const HomeView();
            },
            onRestoreInternetConnection: () => context.read<LaunchBloc>().add(GetNextLaunchEvent()),
          ),
        ),
      ),
    );
  }
}
