part of 'launches_cubit_cubit.dart';

abstract class LaunchesCubitState {}

class LaunchesInit extends LaunchesCubitState {
}

class LaunchesLoaded extends LaunchesCubitState {
  final LaunchModel launchesModel;

  LaunchesLoaded(this.launchesModel);
}
