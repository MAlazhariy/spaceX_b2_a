import '../../rockets_api_service.dart';
import '../model/rocket_model.dart';

class RocketsRepository {
  final RocketsApiService rocketsApiService;

  RocketsRepository(this.rocketsApiService);

  Future<List<RocketModel>> getListOfRockets() async {
    final rockets = await rocketsApiService.apiRockets();

    return rockets.map((e) => RocketModel.fromJson(e)).toList();
  }
}
