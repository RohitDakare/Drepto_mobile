import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:drepto_healthcare/models/user_model.dart';
import 'package:drepto_healthcare/core/repositories/i_auth_repository.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

@lazySingleton
class AuthProvider extends ChangeNotifier {
  final IAuthRepository _authRepository;

  AuthProvider(this._authRepository);

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
      // In a real app, we'd check token validity against the repository
      // For now, we'll keep the logic simple or move token checking to repository
      final isValid = await _authRepository.verifyToken(''); // Placeholder
      if (isValid) {
        _currentUser = await _authRepository.getCurrentUser();
        _status = AuthStatus.authenticated;
      } else {
        await logout();
      }
    } catch (e) {
      _status = AuthStatus.unauthenticated;
      _errorMessage = 'Failed to restore session';
    }
    notifyListeners();
  }

  /// Login with email or mobile number
  Future<bool> login({
    String? email,
    int? mobileNumber,
    required String password,
  }) async {
    try {
      _errorMessage = null;
      notifyListeners();

      final result = await _authRepository.login(
        email: email,
        mobileNumber: mobileNumber,
        password: password,
      );

      _token = result['token'] as String;
      _currentUser = UserModel.fromJson(result['user'] as Map<String, dynamic>);
      _status = AuthStatus.authenticated;
      _errorMessage = null;

      notifyListeners();
      return true;
    } catch (e) {
      _status = AuthStatus.unauthenticated;
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  /// Register a new user (Patient)
  Future<bool> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required int age,
    required int mobileNumber,
    required String gender,
    required UserRole role,
  }) async {
    try {
      _errorMessage = null;
      notifyListeners();

      final result = await _authRepository.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        age: age,
        mobileNumber: mobileNumber,
        gender: gender,
        role: role,
      );

      _token = result['token'] as String;
      _currentUser = UserModel.fromJson(result['user'] as Map<String, dynamic>);
      _status = AuthStatus.authenticated;
      _errorMessage = null;

      notifyListeners();
      return true;
    } catch (e) {
      _status = AuthStatus.unauthenticated;
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  /// Logout user
  Future<void> logout() async {
    try {
      await _authRepository.logout();
    } catch (e) {
      // Continue
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
      final newToken = await _authRepository.refreshToken();
      _token = newToken;
      notifyListeners();
    } catch (e) {
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

      final updatedUser = await _authRepository.updateUserProfile(
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
      case UserRole.admin:
        return '/dashboard/admin';
    }
  }

  /// Change password
  Future<bool> changePassword(String oldPassword, String newPassword) async {
    try {
      if (_currentUser == null) {
        _errorMessage = 'No user session found';
        notifyListeners();
        return false;
      }

      _errorMessage = null;
      notifyListeners();

      await _authRepository.changePassword(
        email: _currentUser!.email,
        oldPassword: oldPassword,
        newPassword: newPassword,
      );

      _errorMessage = null;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }
}
