import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../data/model/rocket_model.dart';
import '../data/repository/rockets_repository.dart';


part 'rockets_state.dart';

class RocketsCubit extends Cubit<RocketsState> {
  final RocketsRepository rocketsRepository;
  List<RocketModel> rockets = [];
  RocketsCubit(
    this.rocketsRepository,
  ) : super(RocketsInitial());

  List<RocketModel> getRockets() {
    emit(RocketsLoading());
    rocketsRepository.getListOfRockets().then(
      (rockes) {
        emit(RocketsLoaded(rockes));

        rockets = rockes;
      },
    ).onError((error, stackTrace) {
      emit(RocketsError());
    });

    return rockets;
  }
}
