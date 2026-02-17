import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:drepto_healthcare/core/network/api_service.dart';
import 'package:drepto_healthcare/core/services/secure_storage_service.dart';

// We'll reuse IAuthRepository style for login/register but name it AdminRepository
// for specific admin tasks if needed. For now, let's implement the register/login logic
// as requested for /authorized.

@lazySingleton
class AdminRepository {
  Future<Map<String, dynamic>> register({
    required String firstName,
    required String lastName,
    required String gender,
    required String role,
    required int mobileNumber,
    required String roleTitle,
    required String password,
  }) async {
    final data = {
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'role': role,
      'mobileNumber': mobileNumber,
      'roleTitle': roleTitle,
      'password': password,
    };

    final response = await ApiService.post('/authorized/register', data: data);
    final result = response.data as Map<String, dynamic>;

    if (result.containsKey('token')) {
      await SecureStorageService.saveToken(result['token']);
      if (result.containsKey('user')) {
        await SecureStorageService.saveSensitiveData(
          'user_data',
          jsonEncode(result['user']),
        );
      }
    }
    return result;
  }

  Future<Map<String, dynamic>> login({
    required int mobileNumber,
    required String password,
  }) async {
    final data = {
      'mobileNumber': mobileNumber,
      'password': password,
    };

    final response = await ApiService.post('/authorized/login', data: data);
    final result = response.data as Map<String, dynamic>;

    if (result.containsKey('token')) {
      await SecureStorageService.saveToken(result['token']);
      if (result.containsKey('user')) {
        await SecureStorageService.saveSensitiveData(
          'user_data',
          jsonEncode(result['user']),
        );
      }
    }
    return result;
  }
}
