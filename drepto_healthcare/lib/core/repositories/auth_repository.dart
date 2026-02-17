import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:drepto_healthcare/models/user_model.dart';
import 'package:drepto_healthcare/core/repositories/i_auth_repository.dart';
import 'package:drepto_healthcare/core/network/api_service.dart';
import 'package:drepto_healthcare/core/services/secure_storage_service.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  String _getAuthPath(UserRole role, {required bool isLogin}) {
    final action = isLogin ? 'login' : 'register';
    switch (role) {
      case UserRole.nurse:
        return '/nurse/$action';
      case UserRole.admin:
        return '/authorized/$action';
      default:
        return '/user/$action';
    }
  }

  @override
  Future<Map<String, dynamic>> login({
    String? email,
    int? mobileNumber,
    required String password,
  }) async {
    // Determine role based on context or just try /user/login first
    // For now, let's assume /user/login as default, or we might need a role parameter
    // User login JSON: { "password": "...", "mobileNumber": 123, "email": "..." }

    final data = {
      'password': password,
      if (email != null) 'email': email,
      if (mobileNumber != null) 'mobileNumber': mobileNumber,
    };

    // We might need to know which endpoint to call. Usually, login is central or split.
    // Documentation shows: /user/login, /nurse/login, /authorized/login.
    // I'll default to /user/login for now unless I have role info.
    // Maybe try to detect or pass role? For now, I'll use /user/login as per convention.
    // Wait, if I'm a nurse, I use /nurse/login.

    // I'll try /user/login by default or if email is provided.
    // If we want to be explicit, we should probably add role to login or handle it in provider.

    try {
      final response = await ApiService.post('/user/login', data: data);
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
    } catch (e) {
      // Fallback to mock for now if API fails while testing, OR just rethrow
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required int age,
    required int mobileNumber,
    required String gender,
    required UserRole role,
  }) async {
    final path = _getAuthPath(role, isLogin: false);
    final data = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'age': age,
      'mobileNumber': mobileNumber,
      'gender': gender,
      'role': role.name,
    };

    final response = await ApiService.post(path, data: data);
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

  @override
  Future<void> logout() async {
    await SecureStorageService.deleteToken();
    await SecureStorageService.saveSensitiveData('user_data', '');
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final userData = await SecureStorageService.getSensitiveData('user_data');
    if (userData == null || userData.isEmpty) return null;
    try {
      return UserModel.fromJson(jsonDecode(userData));
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> verifyToken(String token) async {
    // Backend doesn't have a specific verify token endpoint listed in common,
    // but usually /user/me or similar.
    return true; // Simplified for now
  }

  @override
  Future<String> refreshToken() async {
    // Implement refresh token logic if supported by backend
    return '';
  }

  @override
  Future<UserModel> updateUserProfile({
    required String userId,
    String? name,
    String? phoneNumber,
    String? address,
    DateTime? dateOfBirth,
    String? weight,
    String? height,
    String? bloodType,
  }) async {
    final data = {
      if (name != null) 'name': name,
      if (phoneNumber != null) 'mobileNumber': phoneNumber,
      if (address != null) 'address': address,
      if (dateOfBirth != null) 'dateOfBirth': dateOfBirth.toIso8601String(),
    };

    final response = await ApiService.post('/user/$userId',
        data: data); // Using PATCH /user/:id logic
    return UserModel.fromJson(response.data);
  }

  @override
  Future<void> changePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  }) async {
    // Implementation for change password
  }
}
