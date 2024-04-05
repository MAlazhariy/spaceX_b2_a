import 'package:spacex/core/network/failure/failure.dart';
import 'package:spacex/features/splash/data/data_source/settings_remote_data_source.dart';
import 'package:dartz/dartz.dart';

abstract class BaseSettingsRepository {
  final BaseSettingsLocalDataSource baseSettingsLocalDataSource;

  BaseSettingsRepository(this.baseSettingsLocalDataSource);

  Either<Failure, bool> isFirstLaunch();

  Future<Either<Failure, void>> setFirstLaunch([bool value = false]);
}

class SettingsRepository extends BaseSettingsRepository {
  SettingsRepository(super.baseSettingsLocalDataSource);

  @override
  Either<Failure, bool> isFirstLaunch() {
    try {
      return Right(baseSettingsLocalDataSource.isFirstLaunch());
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> setFirstLaunch([bool value = false]) async {
    try {
      return Right(await baseSettingsLocalDataSource.setFirstLaunch(value));
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
