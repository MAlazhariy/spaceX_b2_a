part of 'launch_bloc.dart';

class LaunchState extends Equatable {
  // next launch
  final RequestStatus nextLaunchStatus;
  final Failure? nextLaunchFailure;
  final LaunchModel? nextLaunchModel;

  const LaunchState._({
    // next launch
    this.nextLaunchStatus = RequestStatus.init,
    this.nextLaunchFailure,
    this.nextLaunchModel,
  });

  LaunchState _copyWith({
    // next launch
    RequestStatus? nextLaunchStatus,
    Failure? nextLaunchFailure,
    LaunchModel? nextLaunchModel,
  }) {
    return LaunchState._(
      // next launch
      nextLaunchStatus: nextLaunchStatus ?? this.nextLaunchStatus,
      nextLaunchFailure: nextLaunchFailure ?? this.nextLaunchFailure,
      nextLaunchModel: nextLaunchModel ?? this.nextLaunchModel,
    );
  }

  const LaunchState.init() : this._();

  // next launch
  LaunchState _nextLaunchLoading() => _copyWith(nextLaunchStatus: RequestStatus.loading);

  LaunchState _nextLaunchSuccess(LaunchModel launchModel) => _copyWith(nextLaunchStatus: RequestStatus.success, nextLaunchModel: launchModel);

  LaunchState _nextLaunchError(Failure failure) => _copyWith(nextLaunchStatus: RequestStatus.error, nextLaunchFailure: failure);

  @override
  List<Object?> get props => [
        nextLaunchStatus,
        nextLaunchFailure,
        nextLaunchModel,
      ];
}
