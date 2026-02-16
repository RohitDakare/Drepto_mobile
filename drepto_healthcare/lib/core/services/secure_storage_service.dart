import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();

  // Keys
  static const String _authTokenKey = 'auth_token';

  /// Save the authentication token securely
  static Future<void> saveToken(String token) async {
    await _storage.write(key: _authTokenKey, value: token);
  }

  /// Retrieve the authentication token
  static Future<String?> getToken() async {
    return await _storage.read(key: _authTokenKey);
  }

  /// Delete the authentication token (logout)
  static Future<void> deleteToken() async {
    await _storage.delete(key: _authTokenKey);
  }

  /// Save sensitive user data (PHI) encrypted
  static Future<void> saveSensitiveData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Read sensitive user data
  static Future<String?> getSensitiveData(String key) async {
    return await _storage.read(key: key);
  }

  /// Clear all secure storage
  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}

