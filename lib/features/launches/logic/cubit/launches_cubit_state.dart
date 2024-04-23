part of 'launches_cubit_cubit.dart';

@freezed
class LaunchesCubitState with _$LaunchesCubitState {
  const factory LaunchesCubitState.initial() = _Initial;
}

class LaunchesLoaded extends  LaunchesCubitState {

final LaunchesModel  launchesModel;
LaunchesLoaded ( this.launchesModel) ;

}
