part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final bool isFirstLaunch;

  const SettingsState([
    this.isFirstLaunch = true,
  ]);

  @override
  List<Object> get props => [isFirstLaunch];
}
