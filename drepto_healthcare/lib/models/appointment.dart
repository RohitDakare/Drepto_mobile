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
    required String id,
    required String doctorId,
    required String doctorName,
    required String specialty,
    required String hospitalName,
    required DateTime dateTime,
    required AppointmentType type,
    @Default(AppointmentStatus.upcoming) AppointmentStatus status,
    String? zoomLink,
    String? location,
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  // Mock data generator
  static List<Appointment> getMockAppointments() {
    final now = DateTime.now();
    return [
      Appointment(
        id: '1',
        doctorId: '1',
        doctorName: 'Dr. Sarah Smith',
        specialty: 'Cardiologist',
        hospitalName: 'City Heart Center',
        dateTime: now.add(const Duration(days: 1, hours: 2)), // Tomorrow
        type: AppointmentType.online,
        zoomLink: 'https://zoom.us/j/123456789',
      ),
      Appointment(
        id: '2',
        doctorId: '2',
        doctorName: 'Dr. James Wilson',
        specialty: 'Dentist',
        hospitalName: 'Smile Dental Clinic',
        dateTime: now.add(const Duration(days: 3, hours: 5)), // In 3 days
        type: AppointmentType.inPerson,
        location: '123 Medical Lane, Health City',
      ),
      Appointment(
        id: '3',
        doctorId: '4',
        doctorName: 'Dr. Michael Brown',
        specialty: 'Neurologist',
        hospitalName: 'Brain & Spine Institute',
        dateTime: now.add(const Duration(days: 5, hours: 1)), // In 5 days
        type: AppointmentType.online,
        zoomLink: 'https://zoom.us/j/987654321',
      ),
    ];
  }
}
