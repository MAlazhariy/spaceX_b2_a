import 'package:dio/dio.dart';
import 'package:spacex/core/network/api/api_client.dart';

class RocketsApiServes {
  final ApiClient<Response> apiClient;

  RocketsApiServes(this.apiClient);

  Future<List<dynamic>> apiRockets() async {
    try {
      Response response = await apiClient.get('/rockets');

      return response.data;
    } catch (e) {
      return [];
    }
  }
}
