import 'package:dio/dio.dart';
import '../services/secure_storage_service.dart';

class ApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      // CRITICAL: Always use HTTPS in production
      baseUrl:
          'https://api.dreptohealthcare.com', // Placeholder for actual secure domain
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  static void initialize() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Automatically add Auth token to every request
          final token = await SecureStorageService.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          // Handle global errors like 401 Unauthorized
          if (e.response?.statusCode == 401) {
            // Logic to force logout or refresh token
          }
          return handler.next(e);
        },
      ),
    );
  }

  // Generic Secure GET
  static Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } catch (e) {
      rethrow;
    }
  }

  // Generic Secure POST
  static Future<Response> post(String path, {dynamic data}) async {
    try {
      return await _dio.post(path, data: data);
    } catch (e) {
      rethrow;
    }
  }
}
