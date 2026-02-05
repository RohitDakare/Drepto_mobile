import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../services/auth_service.dart';
import '../services/secure_storage_service.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthProvider extends ChangeNotifier {
  AuthStatus _status = AuthStatus.unknown;
  String? _token;
  UserModel? _currentUser;
  String? _errorMessage;

  AuthStatus get status => _status;
  String? get token => _token;
  UserModel? get currentUser => _currentUser;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _status == AuthStatus.authenticated;

  /// Call this when the app starts to check for an existing secure session
  Future<void> checkAuthStatus() async {
    try {
      final token = await SecureStorageService.getToken();
      if (token != null && token.isNotEmpty) {
        // Verify token is still valid
        final isValid = await AuthService.verifyToken(token);
        if (isValid) {
          _token = token;
          _currentUser = await AuthService.getCurrentUser();
          _status = AuthStatus.authenticated;
        } else {
          // Token expired or invalid
          await logout();
        }
      } else {
        _status = AuthStatus.unauthenticated;
      }
    } catch (e) {
      _status = AuthStatus.unauthenticated;
      _errorMessage = 'Failed to restore session';
    }
    notifyListeners();
  }

  /// Login with email and password
  Future<bool> login(String email, String password) async {
    try {
      _errorMessage = null;
      notifyListeners();

      final result = await AuthService.login(
        email: email,
        password: password,
      );

      _token = result['token'] as String;
      _currentUser = result['user'] as UserModel;
      _status = AuthStatus.authenticated;
      _errorMessage = null;

      notifyListeners();
      return true;
    } on AuthException catch (e) {
      _status = AuthStatus.unauthenticated;
      _errorMessage = e.message;
      notifyListeners();
      return false;
    } catch (e) {
      _status = AuthStatus.unauthenticated;
      _errorMessage = 'An unexpected error occurred. Please try again.';
      notifyListeners();
      return false;
    }
  }

  /// Register a new user
  Future<bool> register({
    required String email,
    required String password,
    required String name,
    required UserRole role,
    String? phoneNumber,
  }) async {
    try {
      _errorMessage = null;
      notifyListeners();

      final result = await AuthService.register(
        email: email,
        password: password,
        name: name,
        role: role,
        phoneNumber: phoneNumber,
      );

      _token = result['token'] as String;
      _currentUser = result['user'] as UserModel;
      _status = AuthStatus.authenticated;
      _errorMessage = null;

      notifyListeners();
      return true;
    } on AuthException catch (e) {
      _status = AuthStatus.unauthenticated;
      _errorMessage = e.message;
      notifyListeners();
      return false;
    } catch (e) {
      _status = AuthStatus.unauthenticated;
      _errorMessage = 'An unexpected error occurred. Please try again.';
      notifyListeners();
      return false;
    }
  }

  /// Logout user
  Future<void> logout() async {
    try {
      await AuthService.logout();
    } catch (e) {
      // Continue with logout even if service call fails
    }

    _token = null;
    _currentUser = null;
    _status = AuthStatus.unauthenticated;
    _errorMessage = null;
    notifyListeners();
  }

  /// Clear error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  /// Refresh authentication token
  Future<void> refreshToken() async {
    try {
      final newToken = await AuthService.refreshToken();
      _token = newToken;
      notifyListeners();
    } catch (e) {
      // If refresh fails, logout user
      await logout();
    }
  }

  /// Update user profile
  Future<bool> updateUserProfile({
    String? name,
    String? phoneNumber,
    String? address,
    DateTime? dateOfBirth,
    String? weight,
    String? height,
    String? bloodType,
  }) async {
    try {
      if (_currentUser == null) {
        _errorMessage = 'No user session found';
        notifyListeners();
        return false;
      }

      _errorMessage = null;
      notifyListeners();

      final updatedUser = await AuthService.updateUserProfile(
        userId: _currentUser!.id,
        name: name,
        phoneNumber: phoneNumber,
        address: address,
        dateOfBirth: dateOfBirth,
        weight: weight,
        height: height,
        bloodType: bloodType,
      );

      _currentUser = updatedUser;
      _errorMessage = null;
      notifyListeners();
      return true;
    } on AuthException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      return false;
    } catch (e) {
      _errorMessage = 'Failed to update profile. Please try again.';
      notifyListeners();
      return false;
    }
  }

  /// Get user's role-specific dashboard route
  String getDashboardRoute() {
    if (_currentUser == null) return '/login';

    switch (_currentUser!.role) {
      case UserRole.doctor:
        return '/dashboard/doctor';
      case UserRole.nurse:
        return '/dashboard/nurse';
      case UserRole.patient:
        return '/dashboard';
      case UserRole.pharmacy:
        return '/pharmacy/admin';
    }
  }
}
