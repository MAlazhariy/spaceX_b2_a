import 'package:dartz/dartz.dart';
import 'package:spacex/core/network/failure/failure.dart';
import 'package:spacex/features/capsules/data/data_source/capsule_remote_data_source.dart';
import 'package:spacex/features/capsules/data/model/capsule_model.dart';
import 'package:spacex/features/launches/data/data_source/launch_remote_data_source.dart';
import 'package:spacex/features/launches/data/model/launch_model.dart';

abstract class BaseCapsuleRepository {
  final BaseCapsuleRemoteDataSource capsuleRemoteDataSource;

  BaseCapsuleRepository(this.capsuleRemoteDataSource);

  Future<Either<Failure, List<CapsuleModel>>> getCapsules();
}

class CapsuleRepository extends BaseCapsuleRepository {
  CapsuleRepository(super.capsuleRemoteDataSource);

  @override
  Future<Either<Failure, List<CapsuleModel>>> getCapsules() async {
    try {
      return right(await capsuleRemoteDataSource.getCapsules());
    } catch (e) {
      return left(Failure.fromException(e));
    }
  }
}
