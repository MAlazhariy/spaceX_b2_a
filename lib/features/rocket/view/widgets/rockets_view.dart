import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/widgets/main/main_circular_progress_adaptive.dart';
import 'package:spacex/features/rocket/data/model/rocket_model.dart';
import 'package:spacex/features/rocket/view/screens/rockets_list.dart';

import '../../logic/rockets_cubit.dart';

class RocketsView extends StatefulWidget {
  const RocketsView({super.key});

  @override
  State<RocketsView> createState() => _RocketsViewState();
}

class _RocketsViewState extends State<RocketsView> {
  late List<RocketModel> rockets;

  @override
  void initState() {
    super.initState();
    // todo: zak - not best practice
    // todo: zak - this way gets the rockets each time the widget created!
    // you should get the rockets when create the cubit .. or make function to get rockets if not exists
    rockets = BlocProvider.of<RocketsCubit>(context).getRockets();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RocketsCubit, RocketsState>(
      builder: (context, state) {
        if (state is RocketsLoading) {
          return const MainCircularProgress();
        } else if (state is RocketsLoaded) {
          rockets = state.rockets;

          return RocketListView(rockets: rockets);
        }

        return const Center(child: Text('Error occurred!'));
      },
    );
    ;
  }
}
