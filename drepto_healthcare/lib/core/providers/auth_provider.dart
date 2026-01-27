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

    // TODO: Implement actual API login
    // For now, we won't mock a successful login to avoid keeping mock data.
    // However, to allow the user to 'enter', we might typically show an error or 
    // waiting for backend. But since the request is strictly to remove mock data...
    
    // Changing behavior: Login now requires backend. 
    // IF the user needs to bypass login to test UI, they should implement a 'Demo Mode' explicitly
    // rather than us hiding a mock token here.
    
    // _token = ... 
    // await SecureStorageService.saveToken(_token!);
    // _status = AuthStatus.authenticated;
    // notifyListeners();
    
    throw UnimplementedError('Backend login not integrated yet.');
  }

  Future<void> logout() async {
    await SecureStorageService.deleteToken();
    _token = null;
    _status = AuthStatus.unauthenticated;
    notifyListeners();
  }
}
