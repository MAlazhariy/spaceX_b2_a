import 'package:bloc/bloc.dart';
import 'package:spacex/features/launches/data/model/launch_model.dart';
import 'package:spacex/features/launches/data/repository/LaunchesRepository.dart';

part 'launches_cubit_state.dart';

class LaunchesCubitCubit extends Cubit<LaunchesCubitState> {
  LaunchesCubitCubit(this.launchesRepository) : super(LaunchesInit());

  final LaunchesRepository launchesRepository;
  LaunchModel? launchesModel;

  Future<LaunchModel?> getAllLaunches() async {
    // calling function getallfunctions from LaunchesRespository

    final model = await launchesRepository.getAllLaunches();

    emit(LaunchesLoaded(model));

    this.launchesModel = model;

    return model;
  }
}
