import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/widgets/main/main_circular_progress_adaptive.dart';

import '../../../../core/network/models/RocketModel.dart';
import '../../logic/rockets_cubit.dart';
import '../widgets/bottomSheet.dart';

class RocketsScreen extends StatefulWidget {
  const RocketsScreen({Key? key}) : super(key: key);

  @override
  State<RocketsScreen> createState() => _RocketsScreenState();
}

class _RocketsScreenState extends State<RocketsScreen> {
  late List<rocketModel> rockets;
  @override
  void initState() {
    super.initState();

    rockets = BlocProvider.of<RocketsCubit>(context).getRockets();
  }

  Widget BuildBlocWidget() {
    return BlocBuilder<RocketsCubit, RocketsState>(builder: (context, state) {
      if (state is RocketsLoaded) {
        rockets = (state).rockets;

        return BuildRocketsList();
      } else {
        return showLoadingIndicator();
      }
    });
  }

  Widget showLoadingIndicator() {
    // tip: use `CircularProgressIndicator.adaptive` instead
    return Center(
        child: MainCircularProgress(color: Colors.yellow),
    );
  }

  // todo: naming convention
  Widget BuildRocketsList() {
    return ListView.builder(
        itemCount: rockets.length,
        itemBuilder: (item, index) {
          final rocket = rockets[index];

          return GestureDetector(
            onTap: () {
              showBottomSheett(context, rocket: rocket);
            },
            child: Card(
              margin: const EdgeInsets.only(top: 25, left: 15, right: 15),
              color: Colors.grey,
              child: ListTile(
                title: Text(
                  rocket.name,
                  style: const TextStyle(fontSize: 35),
                ),
                subtitle: Text(
                  "\$${rocket.cost.toString()}",
                  style: const TextStyle(fontSize: 35),
                ),
                //  subtitle: Text(rockets[index].description!.substring(0,43)+"...",style: TextStyle(fontSize: 20),),
                leading: Image.network(rockets[index].img),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // todo: make it class instead of the function
      body: BuildBlocWidget(),
    );
  }
}
