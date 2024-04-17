import 'package:dio/dio.dart';

class RocketsApiServes {
  final Dio dio;

  RocketsApiServes(this.dio);

  Future<List<dynamic>> apiRockets() async {
    try {
      Response response =
          await dio.get('https://api.spacexdata.com/v4/rockets');

      return response.data;
    } catch (e) {
      return [];
      // TODO
    }
  }
}
