import 'package:connection_wrapper/connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:spacex/core/resources/app_images.dart';
import 'package:spacex/core/resources/app_size.dart';
import 'package:spacex/core/utils/extensions/context_extension.dart';
import 'package:spacex/core/widgets/main/main_background.dart';
import 'package:spacex/features/home/view/widgets/next_launch_widget.dart';
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
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      AppLottie.astronautNoInternet,
                    ),
                    const SizedBox(height: AppSize.paddingExtraLarge),
                    Text(
                      'No internet connection!',
                      style: context.styleHeader1.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              }

              return Column(
                children: [
                  const NextLaunchWidget(),
                  // todo: dragons
                  // todo: ships
                  // todo: capsuls
                  // todo: all launches
                ],
              );
            },
            onRestoreInternetConnection: () => context.read<LaunchBloc>().add(GetNextLaunchEvent()),
          ),
        ),
      ),
    );
  }
}
