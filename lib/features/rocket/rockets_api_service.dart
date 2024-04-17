import 'package:dio/dio.dart';
import 'package:spacex/core/constants.dart';
import 'package:spacex/core/network/api/api_client.dart';

class RocketsApiService {
  final ApiClient<Response> apiClient;

  RocketsApiService(this.apiClient);

  Future<List> apiRockets() async {
    try {
      final response = await apiClient.get(AppConstants.ROCKETS);

      return response.data;
    } catch (e) {
      // todo: zak - Error handling!
      // If error occurred, how could I know if error occurred or not?
      //
      // you just returned an empty list but you did not let me know
      // if there is an error.
      return [];
    }
  }
}
