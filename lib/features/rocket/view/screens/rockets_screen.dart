import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/models/RocketModel.dart';
import '../../logic/rockets_cubit.dart';
import '../widgets/bottomSheet.dart';

class RocketsScreen extends StatefulWidget {
  // todo: zak - add <const> key + old Flutter version
  RocketsScreen({Key? key}) : super(key: key);

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
    return Center(
        child: CircularProgressIndicator(
          color: Colors.yellow,
        ));
  }

  Widget BuildRocketsList() {
    return ListView.builder(
        itemCount: rockets.length,
        itemBuilder: (item, index) {
          return GestureDetector(
            onTap: () {
              showBottomSheett(context, rocket: rockets[index]);
            },
            child: Card(
              margin: EdgeInsets.only(top: 25, left: 15, right: 15),
              color: Colors.grey,
              child: ListTile(
                title: Text(
                  rockets[index].name!,
                  style: TextStyle(fontSize: 35),
                ),
                subtitle: Text(
                  "\$${rockets[index].cost!.toString()}",
                  style: TextStyle(fontSize: 35),
                ),
                //  subtitle: Text(rockets[index].description!.substring(0,43)+"...",style: TextStyle(fontSize: 20),),
                leading: Image.network(rockets[index].img!),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BuildBlocWidget(),
    );
  }
}
