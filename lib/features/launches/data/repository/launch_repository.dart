import 'package:dartz/dartz.dart';
import 'package:spacex/core/network/failure/failure.dart';
import 'package:spacex/features/launches/data/data_source/launch_remote_data_source.dart';
import 'package:spacex/features/launches/data/model/launch_model.dart';

abstract class BaseLaunchRepository {
  final BaseLaunchRemoteDataSource launchRemoteDataSource;

  BaseLaunchRepository(this.launchRemoteDataSource);

  Future<Either<Failure, LaunchModel>> getNextLaunch();
}

class LaunchRepository extends BaseLaunchRepository {
  LaunchRepository(super.launchRemoteDataSource);

  @override
  Future<Either<Failure, LaunchModel>> getNextLaunch() async {
    try {
      return right(await launchRemoteDataSource.getNextLaunch());
    } catch (e) {
      return left(Failure.fromException(e));
    }
  }
}
