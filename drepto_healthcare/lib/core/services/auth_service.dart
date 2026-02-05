import 'dart:convert';
import 'package:crypto/crypto.dart';
import '../../models/user_model.dart';
import 'secure_storage_service.dart';

class AuthException implements Exception {
  final String message;
  final String? code;

  AuthException(this.message, {this.code});

  @override
  String toString() => message;
}

class AuthService {
  // In-memory storage for registered users (replaces mock data)
  // In production, this would be replaced with actual backend API calls
  static final Map<String, Map<String, dynamic>> _mockUsers = {
    'adityasanjaynaikwadi@gmail.com': {
      'password': _hashPassword('Aditya@27'),
      'user': {
        'id': '1',
        'email': 'adityasanjaynaikwadi@gmail.com',
        'name': 'Aditya Sanjay Naikwadi',
        'role': 'patient',
        'phoneNumber': '+91 9876543210',
        'isEmailVerified': true,
        'isPhoneVerified': true,
        'createdAt': DateTime.now().subtract(const Duration(days: 30)).toIso8601String(),
        'lastLoginAt': DateTime.now().toIso8601String(),
        'weight': '70',
        'height': '175',
        'bloodType': 'O+',
      }
    },
    'admin@drepto.com': {
      'password': _hashPassword('Admin@123'),
      'user': {
        'id': 'admin_1',
        'email': 'admin@drepto.com',
        'name': 'Super Admin',
        'role': 'admin',
        'phoneNumber': '+91 0000000000',
        'isEmailVerified': true,
        'isPhoneVerified': true,
        'createdAt': DateTime.now().subtract(const Duration(days: 365)).toIso8601String(),
        'lastLoginAt': DateTime.now().toIso8601String(),
      }
    },
  };

  // Hash password for mock authentication
  static String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

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
      throw AuthException('Email and password are required', code: 'INVALID_INPUT');
    }

    // Email format validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      throw AuthException('Invalid email format', code: 'INVALID_EMAIL');
    }

    // Password strength validation
    if (password.length < 6) {
      throw AuthException('Password must be at least 6 characters', code: 'WEAK_PASSWORD');
    }

    // MOCK AUTHENTICATION - Replace with actual API call
    // In production: final response = await ApiService.post('/auth/login', data: {...});
    
    final normalizedEmail = email.toLowerCase().trim();
    final hashedPassword = _hashPassword(password);

    if (!_mockUsers.containsKey(normalizedEmail)) {
      throw AuthException('Invalid email or password', code: 'INVALID_CREDENTIALS');
    }

    final userData = _mockUsers[normalizedEmail]!;
    if (userData['password'] != hashedPassword) {
      throw AuthException('Invalid email or password', code: 'INVALID_CREDENTIALS');
    }

    // Generate mock token (in production, this comes from backend)
    final token = _generateMockToken(normalizedEmail);

    // Store token securely
    await SecureStorageService.saveToken(token);

    // Store user data
    await SecureStorageService.saveSensitiveData(
      'user_data',
      jsonEncode(userData['user']),
    );

    return {
      'token': token,
      'user': UserModel.fromJson(userData['user'] as Map<String, dynamic>),
    };
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
      throw AuthException('Password must be at least 8 characters', code: 'WEAK_PASSWORD');
    }

    final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]');
    if (!passwordRegex.hasMatch(password)) {
      throw AuthException(
        'Password must contain uppercase, lowercase, number, and special character',
        code: 'WEAK_PASSWORD',
      );
    }

    // MOCK REGISTRATION - Replace with actual API call
    // In production: final response = await ApiService.post('/auth/register', data: {...});

    final normalizedEmail = email.toLowerCase().trim();

    // Check if user already exists
    if (_mockUsers.containsKey(normalizedEmail)) {
      throw AuthException('Email already registered', code: 'EMAIL_EXISTS');
    }

    // Create new user
    final newUser = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'email': normalizedEmail,
      'name': name,
      'role': role.name,
      'phoneNumber': phoneNumber,
      'isEmailVerified': false,
      'isPhoneVerified': false,
      'createdAt': DateTime.now().toIso8601String(),
      'lastLoginAt': DateTime.now().toIso8601String(),
    };

    // Store in mock database
    _mockUsers[normalizedEmail] = {
      'password': _hashPassword(password),
      'user': newUser,
    };

    // Generate token
    final token = _generateMockToken(normalizedEmail);

    // Store token and user data
    await SecureStorageService.saveToken(token);
    await SecureStorageService.saveSensitiveData('user_data', jsonEncode(newUser));

    return {
      'token': token,
      'user': UserModel.fromJson(newUser),
    };
  }

  /// Get current user from stored data
  static Future<UserModel?> getCurrentUser() async {
    try {
      final userDataJson = await SecureStorageService.getSensitiveData('user_data');
      if (userDataJson == null) return null;

      final userData = jsonDecode(userDataJson) as Map<String, dynamic>;
      return UserModel.fromJson(userData);
    } catch (e) {
      return null;
    }
  }

  /// Verify if token is valid
  static Future<bool> verifyToken(String token) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // MOCK VERIFICATION - Replace with actual API call
    // In production: final response = await ApiService.post('/auth/verify', data: {'token': token});

    // Simple mock validation
    return token.startsWith('mock_token_') && token.length > 20;
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
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    // Get current user data
    final currentUser = await getCurrentUser();
    if (currentUser == null) {
      throw AuthException('No user session found', code: 'NO_SESSION');
    }

    // MOCK UPDATE - Replace with actual API call
    // In production: final response = await ApiService.put('/user/profile', data: {...});

    // Update user in mock database
    final userEmail = currentUser.email.toLowerCase().trim();
    if (_mockUsers.containsKey(userEmail)) {
      final updatedUser = currentUser.copyWith(
        name: name ?? currentUser.name,
        phoneNumber: phoneNumber ?? currentUser.phoneNumber,
        address: address ?? currentUser.address,
        dateOfBirth: dateOfBirth ?? currentUser.dateOfBirth,
        weight: weight ?? currentUser.weight,
        height: height ?? currentUser.height,
        bloodType: bloodType ?? currentUser.bloodType,
      );

      // Update in mock database
      _mockUsers[userEmail]!['user'] = updatedUser.toJson();

      // Update in secure storage
      await SecureStorageService.saveSensitiveData(
        'user_data',
        jsonEncode(updatedUser.toJson()),
      );

      return updatedUser;
    }

    throw AuthException('User not found', code: 'USER_NOT_FOUND');
  }

  /// Generate mock JWT token (for development only)
  static String _generateMockToken(String email) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final payload = '$email:$timestamp';
    final bytes = utf8.encode(payload);
    final hash = sha256.convert(bytes);
    return 'mock_token_${hash.toString().substring(0, 32)}';
  }

  /// Refresh authentication token
  static Future<String> refreshToken() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // MOCK REFRESH - Replace with actual API call
    // In production: final response = await ApiService.post('/auth/refresh');

    final currentUser = await getCurrentUser();
    if (currentUser == null) {
      throw AuthException('No user session found', code: 'NO_SESSION');
    }

    final newToken = _generateMockToken(currentUser.email);
    await SecureStorageService.saveToken(newToken);

    return newToken;
  }

  /// Request password reset
  static Future<void> requestPasswordReset(String email) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Validate email
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      throw AuthException('Invalid email format', code: 'INVALID_EMAIL');
    }

    // MOCK - Replace with actual API call
    // In production: await ApiService.post('/auth/forgot-password', data: {'email': email});

    // For mock, just check if email exists
    if (!_mockUsers.containsKey(email.toLowerCase().trim())) {
      // Don't reveal if email exists for security
      // Just return success
    }
  }
  /// Change password
  static Future<void> changePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    final normalizedEmail = email.toLowerCase().trim();

    // In production: await ApiService.post('/auth/change-password', data: {...});
    
    if (!_mockUsers.containsKey(normalizedEmail)) {
      throw AuthException('User not found', code: 'USER_NOT_FOUND');
    }

    final userData = _mockUsers[normalizedEmail]!;
    final oldPasswordHash = _hashPassword(oldPassword);

    if (userData['password'] != oldPasswordHash) {
      throw AuthException('Incorrect old password', code: 'INVALID_CREDENTIALS');
    }

    if (newPassword.length < 8) {
      throw AuthException('New password must be at least 8 characters', code: 'WEAK_PASSWORD');
    }
    
    // Update password
    _mockUsers[normalizedEmail]!['password'] = _hashPassword(newPassword);
  }

  /// Get all users (for Admin Dashboard)
  static Future<List<UserModel>> getAllUsers() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockUsers.values
        .map((data) => UserModel.fromJson(data['user'] as Map<String, dynamic>))
        .toList();
  }

  /// Get user statistics (for Admin Dashboard)
  static Future<Map<String, int>> getUserStats() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final users = _mockUsers.values
        .map((data) => UserModel.fromJson(data['user'] as Map<String, dynamic>))
        .toList();

    return {
      'total': users.length,
      'patients': users.where((u) => u.role == UserRole.patient).length,
      'doctors': users.where((u) => u.role == UserRole.doctor).length,
      'nurses': users.where((u) => u.role == UserRole.nurse).length,
      'pharmacy': users.where((u) => u.role == UserRole.pharmacy).length,
    };
  }
}
