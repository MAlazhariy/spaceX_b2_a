// todo: zak - naming convention of the file
import 'package:dio/dio.dart';
import 'package:spacex/core/network/api/api_client.dart';

// todo: zak - naming of the class
// `Service` instead `Serves`
class RocketsApiServes {

  // OLD CODE
  // todo: zak - ❌ Get `ApiClient` instead of getting `Dio` directly
  /// you should use a one of SOLID principles here.
  /// Do you know what is it?
  // final Dio dio;
  //
  //   RocketsApiServes(this.dio);
  //
  // Future<List<dynamic>> apiRockets() async {
  //     try {
  /// todo: zak - ❌ Do not write the endpoint by yourself (Hard-code)
  /// todo: zak - ❌ Do not write the domain by yourself (Hard-code)
  /// todo: zak - Do not write the domain everytime you make a response, instead you should use an instance
  /// - What if the DOMAIN has changed?!
  ///
  /// 💡: make a file for endpoints.
  /// 💡: set the domain in ONE PLACE and always get it from there.
  //       Response response =
  //           await dio.get('https://api.spacexdata.com/v4/rockets');
  //
  //       return response.data;
  //     } catch (e) {
  //       return [];
  //     }
  //   }




  final ApiClient<Response> apiClient;

  RocketsApiServes(this.apiClient);

  // todo: zak - you do not need to type `<dynamic>` keyword .. preferred to set the return type, i.e: `List<Map<String, dynamic>>`
  Future<List<dynamic>> apiRockets() async {
    try {
      Response response = await apiClient.get('/rockets');

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
