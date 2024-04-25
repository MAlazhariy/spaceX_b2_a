import 'package:spacex/features/launches/data/model/launch_model.dart';
import 'package:spacex/features/launches/data/web_services/launchesWebservices.dart';

class LaunchesRepository {
  final LaunchesWebServices launchesWebServices;

  LaunchesRepository({
    required this.launchesWebServices,
  });

  Future<LaunchModel> getAllLaunches() async {
    final launchesJson = await launchesWebServices.getAllLaunches();

    return LaunchModel.fromJson((launchesJson));
  }
}
