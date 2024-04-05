import 'package:spacex/features/splash/data/repository/settings_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this.settingsRepository) : super(const SettingsState());

  final BaseSettingsRepository settingsRepository;

  Future<void> setFirstLaunch([bool value = false]) async {
    await settingsRepository.setFirstLaunch(value);
    emit(SettingsState(value));
  }

  bool isFirstLaunch() {
    bool value = true;
    final result = settingsRepository.isFirstLaunch();
    result.fold(
      (l) => null,
      (r) {
        value = r;
        emit(SettingsState(r));
      },
    );

    return value;
  }
}
