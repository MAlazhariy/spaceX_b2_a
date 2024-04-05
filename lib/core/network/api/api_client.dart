abstract class ApiClient<Response> {
  Future<Response> get(
    String path, {
    Map<String, dynamic>? params,
  });

  Future<Response> post(
    String path, {
    data,
    Map<String, dynamic>? params,
  });

  Future<Response> put(
    String path, {
    data,
    Map<String, dynamic>? params,
  });

  Future<Response> delete(
    String path, {
    data,
    Map<String, dynamic>? params,
  });

  void updateToken(String? token);
}
