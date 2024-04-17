// todo: zak - file naming convention `snake_case`
// todo: zak - Move the file to its feature directory
// We are here using division by FEATURES not div by LAYERS.

import '../api/Rockets_ApiServes.dart';
import '../models/RocketModel.dart';

// todo: zak - correct `repository` spilling in the class and file.
class RocketsReposetory {
  final RocketsApiServes rocketsApiServes;

  RocketsReposetory(this.rocketsApiServes);

  Future<List<rocketModel>> getListOfRockets() async {
    final rocketts = await rocketsApiServes.apiRockets();

   

    return rocketts.map((e) => rocketModel.fromJson(e)).toList();
  }
}
