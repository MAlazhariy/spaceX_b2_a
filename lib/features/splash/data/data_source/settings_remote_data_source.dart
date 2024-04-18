import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex/core/constants.dart';
import 'package:spacex/core/network/failure/exceptions/local_exception.dart';

abstract class BaseSettingsLocalDataSource {
  final SharedPreferences sharedPreferences;

  BaseSettingsLocalDataSource(this.sharedPreferences);

  bool isFirstLaunch();

  Future<void> setFirstLaunch(bool value);
}

class SettingsLocalDataSource extends BaseSettingsLocalDataSource {
  SettingsLocalDataSource(super.apiClient);

  @override
  bool isFirstLaunch() {
    try {
      return sharedPreferences.getBool(AppConstants.FIRST_LAUNCH_KEY) != false;
    } catch (e) {
      throw LocalException(message: '$e');
    }
  }

  @override
  Future<void> setFirstLaunch(bool value) async {
    try {
      await sharedPreferences.setBool(AppConstants.FIRST_LAUNCH_KEY, value);
    } catch (e) {
      throw LocalException(message: '$e');
    }
  }
}
