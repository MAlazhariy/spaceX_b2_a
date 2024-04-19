import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex/core/network/failure/failure.dart';
import 'package:spacex/core/utils/enums/request_status.dart';
import 'package:spacex/features/capsules/data/model/capsule_model.dart';
import 'package:spacex/features/capsules/data/repository/capsule_repository.dart';
import 'package:spacex/features/launches/data/model/launch_model.dart';
import 'package:spacex/features/launches/data/repository/launch_repository.dart';

part 'capsule_event.dart';

part 'capsule_state.dart';

class CapsuleBloc extends Bloc<CapsuleEvent, CapsuleState> {
  CapsuleBloc(this._capsuleRepository) : super(const CapsuleState.init()) {
    on<GetCapsulesEvent>(_onGetCapsules);
  }

  final BaseCapsuleRepository _capsuleRepository;

  FutureOr<void> _onGetCapsules(GetCapsulesEvent event, Emitter<CapsuleState> emit) async {
    emit(state._capsulesLoading());

    final result = await _capsuleRepository.getCapsules();

    emit(
      result.fold(
        (l) => state._capsulesError(l),
        (r) => state._capsulesSuccess(r),
      ),
    );
  }
}
