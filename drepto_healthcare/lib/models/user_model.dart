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
    required String firstName,
    required String lastName,
    required UserRole role,
    int? age,
    String? gender,
    int? mobileNumber, // From backend DTO
    String? profileImageUrl,
    DateTime? dateOfBirth,
    String? address,
    @Default(false) bool isEmailVerified,
    @Default(false) bool isPhoneVerified,
    required DateTime createdAt,
    DateTime? lastLoginAt,
    // Health stats
    String? weight,
    String? height,
    String? bloodType,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // Create a copy to avoid mutating the original map
    final Map<String, dynamic> data = Map<String, dynamic>.from(json);
    if (data['role'] is String) {
      data['role'] = (data['role'] as String).toLowerCase();
    }
    return _$UserModelFromJson(data);
  }

  String get name => '$firstName $lastName';
  String get phoneNumber => mobileNumber?.toString() ?? '';

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
