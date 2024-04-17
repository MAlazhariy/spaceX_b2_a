import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex/core/network/failure/failure.dart';
import 'package:spacex/core/utils/enums/request_status.dart';
import 'package:spacex/features/launches/data/model/launch_model.dart';
import 'package:spacex/features/launches/data/repository/launch_repository.dart';

part 'launch_event.dart';

part 'launch_state.dart';

class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  LaunchBloc(this._launchRepository) : super(const LaunchState.init()) {
    on<GetNextLaunchEvent>(_onGetNextLaunch);
  }

  final BaseLaunchRepository _launchRepository;

  FutureOr<void> _onGetNextLaunch(GetNextLaunchEvent event, Emitter<LaunchState> emit) async {
    emit(state._nextLaunchLoading());

    final result = await _launchRepository.getNextLaunch();

    emit(
      result.fold(
        (l) => state._nextLaunchError(l),
        (r) => state._nextLaunchSuccess(r),
      ),
    );
  }
}
