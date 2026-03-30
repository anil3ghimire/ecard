import 'package:dio/dio.dart';

class ApiService {
  late Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        headers: {
          "Accept": "application/json", // we accept JSON from server
          "Content-Type": "application/json", // we send JSON to server
        },
      ),
    );
    _addInterceptors();
  }

  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("➡️ REQUEST: ${options.method} ${options.path}");
          // Example: Add token
          options.headers["Authorization"] = "Bearer YOUR_TOKEN";

          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("✅ RESPONSE: ${response.statusCode}");
          return handler.next(response);
        },

        onError: (DioException e, handler) {
          print("❌ ERROR: ${e.message}");
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response?> get(String endpoint) async {
    try {
      Response response = await _dio.get(endpoint);
      return response;
    } on DioException catch (e) {
      _handleError(e);
      return null;
    } catch (e) {
      print("⚠️ Unexpected Error: $e");
      return null;
    }
  }

  Future<Response?> post(String endpoint, Map<String, dynamic> data) async {
    try {
      Response response = await _dio.post('endpoint', data: data,);
      return response;
    } on DioException catch (e) {
      _handleError(e);
      return null;
    } catch (e) {
      print("⚠️ Unexpected Error: $e");
      return null;
    }
  }


  void _handleError(DioException e) {
    if (e.response != null) {
      print("🔴 Server Error: ${e.response?.statusCode}");
      print("🔴 Data: ${e.response?.data}");
    } else {
      print("🔴 Network Error: ${e.message}");
    }
  }
}
