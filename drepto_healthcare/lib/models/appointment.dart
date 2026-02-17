import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment.freezed.dart';
part 'appointment.g.dart';

enum AppointmentStatus {
  upcoming,
  completed,
  cancelled,
}

enum AppointmentType {
  online,
  inPerson,
}

@freezed
abstract class Appointment with _$Appointment {
  const Appointment._();

  const factory Appointment({
    required String appointmentId,
    required String status,
    String? userId,
    String? patientName,
    String? address,
    String? mobileNumber,
    String? symptoms,
    String? date,
    String? time,
    String? nurseId,
    String? nurseName,
    String? nurseSpecialization,
    String? paymentMethod,
    String? transactionId,
    double? amount,
    // Doctor specific fields if needed
    String? doctorId,
    String? doctorName,
    String? specialty,
    String? hospitalName,
    // Original fields for backward compatibility or general use
    DateTime? dateTime,
    AppointmentType? type,
    String? zoomLink,
    String? location,
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  String get id => appointmentId;

  static List<Appointment> getMockAppointments() {
    return [];
  }
}
