import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor.freezed.dart';
part 'doctor.g.dart';

@freezed
abstract class Doctor with _$Doctor {
  const Doctor._();

  const factory Doctor({
    required String id,
    required String name,
    required String specialty,
    required String hospital,
    required double rating,
    required int reviews,
    required int patients,
    required String about,
    required String imageUrl,
    required List<String> availableSlots,
    required double videoConsultationFee,
    required double clinicVisitFee,
    @Default(false) bool isOnline,
  }) = _Doctor;

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  // Returns empty list - in production, this would fetch from backend API
  static List<Doctor> getMockDoctors() {
    return [];
  }
}
