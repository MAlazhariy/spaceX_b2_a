import '../api/Rockets_ApiServes.dart';
import '../models/RocketModel.dart';

class RocketsReposetory {
  final RocketsApiServes rocketsApiServes;

  RocketsReposetory(this.rocketsApiServes);

  Future<List<rocketModel>> getListOfRockets() async {
    final rocketts = await rocketsApiServes.apiRockets();

   

    return rocketts.map((e) => rocketModel.fromJson(e)).toList();
  }
}
