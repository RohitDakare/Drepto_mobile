import 'package:drepto_healthcare/models/user_model.dart';

abstract class IAuthRepository {
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  });

  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String name,
    required UserRole role,
    String? phoneNumber,
  });

  Future<void> logout();

  Future<UserModel?> getCurrentUser();

  Future<bool> verifyToken(String token);

  Future<String> refreshToken();

  Future<UserModel> updateUserProfile({
    required String userId,
    String? name,
    String? phoneNumber,
    String? address,
    DateTime? dateOfBirth,
    String? weight,
    String? height,
    String? bloodType,
  });

  Future<void> changePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  });
}

