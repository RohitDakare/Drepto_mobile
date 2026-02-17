import 'package:drepto_healthcare/models/appointment.dart';

class AppointmentService {
  // Initialize
  static Future<void> initialize() async {
    // Reset/Initialize real repository if needed
  }

  // Get upcoming appointments
  static Future<List<Appointment>> getUpcomingAppointments() async {
    return [];
  }

  // Get past appointments
  static Future<List<Appointment>> getPastAppointments() async {
    return [];
  }

  // Book new appointment
  static Future<Appointment> bookAppointment({
    required String doctorId,
    required String doctorName,
    required String specialty,
    required DateTime dateTime,
    required AppointmentType type,
  }) async {
    // REAL BOOKING - Needs to be implemented with Repository
    throw Exception('Not implemented');
  }

  // Cancel appointment
  static Future<void> cancelAppointment(String appointmentId) async {
    // REAL CANCELLATION - Needs to be implemented with Repository
  }

  static Future<List<Appointment>> getAllAppointments() async {
    return [];
  }
}
