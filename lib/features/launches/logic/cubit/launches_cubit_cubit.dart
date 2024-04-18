import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'launches_cubit_state.dart';
part 'launches_cubit_cubit.freezed.dart';

class LaunchesCubitCubit extends Cubit<LaunchesCubitState> {
  LaunchesCubitCubit() : super(LaunchesCubitState.initial());



final LaunchesRepository launchesRepository;
LaunchesModel?  launchesModel;

LaunchesRepository (this.LaunchesRepository): super( LaunchesIntial());


LaunchesModel? getAllLaunches(){

  // calling function getallfunctions from LaunchesRespository 

  LaunchesRespository.getAllLaunches().then((LaunchesModel launchesModel)){

emit(LaunchesLoaded(LaunchesModel));

this.launchesModel = LaunchesModel;
} 

return launchesModel;
  
};


}

