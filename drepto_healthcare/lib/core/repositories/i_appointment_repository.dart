import 'package:drepto_healthcare/models/appointment.dart';

abstract class IAppointmentRepository {
  // General Appointments
  Future<void> bookGeneralAppointment(Appointment appointment);
  Future<List<Appointment>> getAppointmentsByUserId(String userId);

  // Nurse Appointments
  Future<void> createNurseAppointment(Map<String, dynamic> data);
  Future<List<dynamic>> getAllNurseAppointments();
  Future<dynamic> getNurseAppointmentById(String id);
  Future<void> updateNurseAppointment(String id, Map<String, dynamic> data);
  Future<void> deleteNurseAppointment(String id);

  // Doctor Appointments
  Future<void> createDoctorAppointment(Map<String, dynamic> data);
  Future<List<dynamic>> getAllDoctorAppointments();
  Future<dynamic> getDoctorAppointmentById(String id);
  Future<void> updateDoctorAppointment(String id, Map<String, dynamic> data);
  Future<void> deleteDoctorAppointment(String id);
}
