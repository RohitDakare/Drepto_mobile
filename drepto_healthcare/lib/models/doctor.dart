import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor.freezed.dart';
part 'doctor.g.dart';

@freezed
abstract class Doctor with _$Doctor {
  const Doctor._();

  const factory Doctor({
    required String id,
    required String name,
    required String specialization,
    required int experienceYears,
    required double rating,
    required String nextAvailable,
    String? hospital,
    int? reviews,
    int? patients,
    String? about,
    String? imageUrl,
    List<String>? availableSlots,
    double? videoConsultationFee,
    double? clinicVisitFee,
    @Default(false) bool isOnline,
  }) = _Doctor;

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  String get specialty => specialization;
}
