part of 'rockets_cubit.dart';

@immutable
sealed class RocketsState {}

final class RocketsInitial extends RocketsState {}

class RocketsLoaded extends RocketsState {
  final List<rocketModel> rockets;

  RocketsLoaded(this.rockets);
}

class RocketsLoading extends RocketsState {}

class RocketsError extends RocketsState {}
