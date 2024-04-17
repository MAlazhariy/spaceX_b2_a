import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../data/model/rocket_model.dart';
import '../data/repository/rockets_repository.dart';


part 'rockets_state.dart';

class RocketsCubit extends Cubit<RocketsState> {
  final RocketsRepository rocketsReposetory;
  List<RocketModel> rockets = [];
  RocketsCubit(
    this.rocketsReposetory,
  ) : super(RocketsInitial());

  List<RocketModel> getRockets() {
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
