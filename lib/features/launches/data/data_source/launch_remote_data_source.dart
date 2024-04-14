import 'package:dio/dio.dart';
import 'package:spacex/core/constants.dart';
import 'package:spacex/core/network/api/api_client.dart';
import 'package:spacex/core/network/failure/exceptions/server_exception.dart';
import 'package:spacex/core/utils/extensions/response_extension.dart';
import 'package:spacex/features/launches/data/model/launch_model.dart';

abstract class BaseLaunchRemoteDataSource {
  final ApiClient<Response> apiClient;

  BaseLaunchRemoteDataSource(this.apiClient);

  Future<LaunchModel> getLaunches();
}

class LaunchRemoteDataSource extends BaseLaunchRemoteDataSource {
  LaunchRemoteDataSource(super.apiClient);

  @override
  Future<LaunchModel> getLaunches() async {
    final response = await apiClient.get(AppConstants.ROCKETS);

    if (response.isSuccess) {
      return LaunchModel.fromJson(response.data);
    }

    throw ServerException.fromResponse(response);
  }
}
