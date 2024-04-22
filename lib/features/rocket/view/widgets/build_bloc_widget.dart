import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/rocket_model.dart';
import '../../logic/rockets_cubit.dart';
import '../screens/rockets_list.dart';



class BuildBlocWidget extends StatelessWidget {
  late List<RocketModel> rockets;

   BuildBlocWidget({super.key, required this.rockets});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RocketsCubit, RocketsState>(builder: (context, state) {
      if (state is RocketsLoaded) {
        rockets = (state).rockets;

        return RocketsList().buildRocketsList(rockets, context);
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}
