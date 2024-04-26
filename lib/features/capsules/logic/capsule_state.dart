part of 'capsule_bloc.dart';

class CapsuleState extends Equatable {
  // capsules
  final RequestStatus capsulesStatus;
  final Failure? capsulesFailure;
  final List<CapsuleModel> capsules;

  const CapsuleState._({
    // capsules
    this.capsulesStatus = RequestStatus.init,
    this.capsulesFailure,
    this.capsules = const [],
  });

  CapsuleState _copyWith({
    // capsules
    RequestStatus? capsulesStatus,
    Failure? capsulesFailure,
    List<CapsuleModel>? capsules,
  }) {
    return CapsuleState._(
      // capsules
      capsulesStatus: capsulesStatus ?? this.capsulesStatus,
      capsulesFailure: capsulesFailure ?? this.capsulesFailure,
      capsules: capsules ?? this.capsules,
    );
  }

  const CapsuleState.init() : this._();

  // capsules
  CapsuleState _capsulesLoading() => _copyWith(capsulesStatus: RequestStatus.loading);

  CapsuleState _capsulesSuccess(List<CapsuleModel> capsules) => _copyWith(capsulesStatus: RequestStatus.success, capsules: capsules);

  CapsuleState _capsulesError(Failure failure) => _copyWith(capsulesStatus: RequestStatus.error, capsulesFailure: failure);

  @override
  List<Object?> get props => [
        capsulesStatus,
        capsulesFailure,
        capsules,
      ];
}
