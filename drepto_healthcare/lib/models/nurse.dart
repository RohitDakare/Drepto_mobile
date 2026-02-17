import 'package:freezed_annotation/freezed_annotation.dart';

part 'nurse.freezed.dart';
part 'nurse.g.dart';

@freezed
abstract class Nurse with _$Nurse {
  const Nurse._();

  const factory Nurse({
    required String firstName,
    required String lastName,
    required int mobileNumber,
    required String gender,
    required String licenseNumber,
    required String role,
    required String specification,
    required String availiability,
    required bool isAvailable,
    required int experienceYears,
    required List<String> serviceTypes,
    String? id,
    String? profileImageUrl,
  }) = _Nurse;

  factory Nurse.fromJson(Map<String, dynamic> json) => _$NurseFromJson(json);
}
