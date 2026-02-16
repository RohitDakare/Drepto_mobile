import 'package:injectable/injectable.dart';
import 'package:drepto_healthcare/models/user_model.dart';
import 'package:drepto_healthcare/core/services/auth_service.dart';
import 'package:drepto_healthcare/core/repositories/i_auth_repository.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    return await AuthService.login(email: email, password: password);
  }

  @override
  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String name,
    required UserRole role,
    String? phoneNumber,
  }) async {
    return await AuthService.register(
      email: email,
      password: password,
      name: name,
      role: role,
      phoneNumber: phoneNumber,
    );
  }

  @override
  Future<void> logout() async {
    return await AuthService.logout();
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    return await AuthService.getCurrentUser();
  }

  @override
  Future<bool> verifyToken(String token) async {
    return await AuthService.verifyToken(token);
  }

  @override
  Future<String> refreshToken() async {
    return await AuthService.refreshToken();
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
    return await AuthService.updateUserProfile(
      userId: userId,
      name: name,
      phoneNumber: phoneNumber,
      address: address,
      dateOfBirth: dateOfBirth,
      weight: weight,
      height: height,
      bloodType: bloodType,
    );
  }

  @override
  Future<void> changePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  }) async {
    return await AuthService.changePassword(
      email: email,
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }
}
