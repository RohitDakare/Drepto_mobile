import 'dart:convert';
import 'package:drepto_healthcare/models/user_model.dart';
import 'secure_storage_service.dart';

class AuthException implements Exception {
  final String message;
  final String? code;

  AuthException(this.message, {this.code});

  @override
  String toString() => message;
}

class AuthService {
  // In production, this would be replaced with actual backend API calls

  // Placeholder for real hashing if needed by UI layer (unlikely)

  /// Login with email and password
  /// Returns user data and authentication token
  /// Throws AuthException on failure
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Validate input
    if (email.isEmpty || password.isEmpty) {
      throw AuthException('Email and password are required',
          code: 'INVALID_INPUT');
    }

    // Email format validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      throw AuthException('Invalid email format', code: 'INVALID_EMAIL');
    }

    // Password strength validation
    if (password.length < 6) {
      throw AuthException('Password must be at least 6 characters',
          code: 'WEAK_PASSWORD');
    }

    // REAL AUTHENTICATION - Needs to be implemented with ApiService
    // For now, removing mock data means this will fail until backend is integrated
    throw AuthException('Backend connection not implemented',
        code: 'NOT_IMPLEMENTED');
  }

  /// Register a new user
  /// Returns user data and authentication token
  /// Throws AuthException on failure
  static Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String name,
    required UserRole role,
    String? phoneNumber,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Validate input
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      throw AuthException('All fields are required', code: 'INVALID_INPUT');
    }

    // Email format validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      throw AuthException('Invalid email format', code: 'INVALID_EMAIL');
    }

    // Password strength validation
    if (password.length < 8) {
      throw AuthException('Password must be at least 8 characters',
          code: 'WEAK_PASSWORD');
    }

    final passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]');
    if (!passwordRegex.hasMatch(password)) {
      throw AuthException(
        'Password must contain uppercase, lowercase, number, and special character',
        code: 'WEAK_PASSWORD',
      );
    }

    // REAL REGISTRATION - Needs to be implemented with ApiService
    throw AuthException('Backend connection not implemented',
        code: 'NOT_IMPLEMENTED');
  }

  /// Get current user from stored data
  static Future<UserModel?> getCurrentUser() async {
    try {
      final userDataJson =
          await SecureStorageService.getSensitiveData('user_data');
      if (userDataJson == null) return null;

      final userData = jsonDecode(userDataJson) as Map<String, dynamic>;
      return UserModel.fromJson(userData);
    } catch (e) {
      return null;
    }
  }

  /// Verify if token is valid
  static Future<bool> verifyToken(String token) async {
    // REAL VERIFICATION - Needs to be implemented with ApiService
    return false;
  }

  /// Logout user
  static Future<void> logout() async {
    await SecureStorageService.deleteToken();
    await SecureStorageService.getSensitiveData('user_data').then((_) {
      SecureStorageService.saveSensitiveData('user_data', '');
    });
  }

  /// Update user profile
  /// Returns updated user data
  /// Throws AuthException on failure
  static Future<UserModel> updateUserProfile({
    required String userId,
    String? name,
    String? phoneNumber,
    String? address,
    DateTime? dateOfBirth,
    String? weight,
    String? height,
    String? bloodType,
  }) async {
    // REAL UPDATE - Needs to be implemented with ApiService
    throw AuthException('Backend connection not implemented',
        code: 'NOT_IMPLEMENTED');
  }

  // JWT token generation logic would happen on backend

  /// Refresh authentication token
  static Future<String> refreshToken() async {
    // REAL REFRESH - Needs to be implemented with ApiService
    throw AuthException('Backend connection not implemented',
        code: 'NOT_IMPLEMENTED');
  }

  /// Request password reset
  static Future<void> requestPasswordReset(String email) async {
    // REAL REQUEST - Needs to be implemented with ApiService
  }

  /// Change password
  static Future<void> changePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  }) async {
    // REAL CHANGE - Needs to be implemented with ApiService
  }

  /// Get all users (for Admin Dashboard)
  static Future<List<UserModel>> getAllUsers() async {
    return [];
  }

  /// Get user statistics (for Admin Dashboard)
  static Future<Map<String, int>> getUserStats() async {
    return {
      'total': 0,
      'patients': 0,
      'doctors': 0,
      'nurses': 0,
      'pharmacy': 0,
    };
  }
}
