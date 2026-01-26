import 'package:flutter/material.dart';
import '../services/secure_storage_service.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthProvider extends ChangeNotifier {
  AuthStatus _status = AuthStatus.unknown;
  String? _token;

  AuthStatus get status => _status;
  String? get token => _token;
  bool get isAuthenticated => _status == AuthStatus.authenticated;

  /// Call this when the app starts to check for an existing secure session
  Future<void> checkAuthStatus() async {
    final token = await SecureStorageService.getToken();
    if (token != null) {
      _token = token;
      _status = AuthStatus.authenticated;
    } else {
      _status = AuthStatus.unauthenticated;
    }
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    // SECURITY: In production, password should be hashed or handled by TLS
    // This is where ApiService.post('/login', ...) would be called

    await Future.delayed(const Duration(seconds: 2));

    // Simulate receiving a secure JWT from backend
    _token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.dummy_secure_payload';

    // Persist token in hardware-encrypted storage
    await SecureStorageService.saveToken(_token!);

    _status = AuthStatus.authenticated;
    notifyListeners();
  }

  Future<void> logout() async {
    await SecureStorageService.deleteToken();
    _token = null;
    _status = AuthStatus.unauthenticated;
    notifyListeners();
  }
}
