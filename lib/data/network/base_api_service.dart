abstract class BaseApiService {
  Future<dynamic> get(String url,
      {Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters});

  Future<dynamic> post(String url, var data,
      {Map<String, dynamic>? headers, Map<String, dynamic>? body});

  Future<dynamic> put(String url,var data,
      {Map<String, dynamic>? headers, Map<String, dynamic>? body});

}
