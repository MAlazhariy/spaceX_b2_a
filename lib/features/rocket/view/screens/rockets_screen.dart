import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/widgets/main/main_background.dart';
import 'package:spacex/core/widgets/main/main_circular_progress_adaptive.dart';
import 'package:spacex/features/rocket/view/screens/rockets_list.dart';

import '../../data/model/rocket_model.dart';
import '../../logic/rockets_cubit.dart';

class RocketsScreen extends StatefulWidget {
  const RocketsScreen({super.key});

  @override
  State<RocketsScreen> createState() => _RocketsScreenState();
}

class _RocketsScreenState extends State<RocketsScreen> {
  late List<RocketModel> rockets;

  @override
  void initState() {
    super.initState();

    rockets = BlocProvider.of<RocketsCubit>(context).getRockets();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<RocketsCubit, RocketsState>(builder: (context, state) {
      if (state is RocketsLoaded) {
        rockets = (state).rockets;

        return RocketsList().buildRocketsList(rockets, context);
      } else {
        return showLoadingIndicator();
      }
    });
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: MainCircularProgress(color: Colors.yellow),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // todo: make it class instead of the function
      body: MainGalaxyBackground(
        child: buildBlocWidget(),
      ),
    );
  }
}
