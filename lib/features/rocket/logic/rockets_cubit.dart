import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/network/models/RocketModel.dart';
import '../../../core/network/repositery/RocketsReposetory.dart';


part 'rockets_state.dart';

class RocketsCubit extends Cubit<RocketsState> {
  final RocketsReposetory rocketsReposetory;
  List<rocketModel> rockets = [];
  RocketsCubit(
    this.rocketsReposetory,
  ) : super(RocketsInitial());

  List<rocketModel> getRockets() {
    emit(RocketsLoading());
    rocketsReposetory.getListOfRockets().then(
      (rockes) {
        emit(RocketsLoaded(rockes));

        this.rockets = rockes;
      },
    );

    return rockets;
  }
}
