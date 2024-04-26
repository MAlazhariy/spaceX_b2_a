import 'package:dio/dio.dart';
import 'package:spacex/core/constants.dart';
import 'package:spacex/core/network/api/api_client.dart';
import 'package:spacex/core/network/failure/exceptions/server_exception.dart';
import 'package:spacex/core/utils/extensions/response_extension.dart';
import 'package:spacex/features/capsules/data/model/capsule_model.dart';

abstract class BaseCapsuleRemoteDataSource {
  final ApiClient<Response> apiClient;

  BaseCapsuleRemoteDataSource(this.apiClient);

  Future<List<CapsuleModel>> getCapsules();
}

class CapsuleRemoteDataSource extends BaseCapsuleRemoteDataSource {
  CapsuleRemoteDataSource(super.apiClient);

  @override
  Future<List<CapsuleModel>> getCapsules() async {
    final response = await apiClient.get(AppConstants.CAPSULES);

    if (response.isSuccess) {
      return List.from(response.data).map((e) => CapsuleModel.fromJson(e)).toList();
    }

    throw ServerException.fromResponse(response);
  }
}
