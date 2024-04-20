class LaunchesWebServices {

  Dio dio = Dio(
    BaseOptions(
      baseUrl: BaseUrl_Laaunches,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(milliseconds: 30000),
      receiveTimeout: Duration(milliseconds: 30000),
    ),
  );

   Future<Map<String, dynamic>> getAllLaunches() async {
    try {
      /*
  waiting to get list of launches from json file that had been done 
  by using await and async because we are callying api from internet waiting data from internet
 */
      Response response = await dio.get('/launches');
      return response.data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }


}