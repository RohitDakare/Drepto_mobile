import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

enum UserRole {
  patient,
  doctor,
  nurse,
  pharmacy,
  admin,
}

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String email,
    required String name,
    required UserRole role,
    String? phoneNumber,
    String? profileImageUrl,
    DateTime? dateOfBirth,
    String? address,
    @Default(false) bool isEmailVerified,
    @Default(false) bool isPhoneVerified,
    required DateTime createdAt,
    DateTime? lastLoginAt,
    // Health stats
    String? weight, // in kg
    String? height, // in cm
    String? bloodType, // e.g., "O+", "A-"
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  String get roleDisplayName {
    switch (role) {
      case UserRole.patient:
        return 'Patient';
      case UserRole.doctor:
        return 'Doctor';
      case UserRole.nurse:
        return 'Nurse';
      case UserRole.pharmacy:
        return 'Pharmacy Staff';
      case UserRole.admin:
        return 'Administrator';
    }
  }
}
