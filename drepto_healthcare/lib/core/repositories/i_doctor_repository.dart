import 'package:drepto_healthcare/models/doctor.dart';

abstract class IDoctorRepository {
  Future<void> createDoctor(Doctor doctor);
  Future<List<Doctor>> getAllDoctors();
  Future<Doctor> getDoctorById(String id);
  Future<void> updateDoctor(String id, Map<String, dynamic> data);
  Future<void> deleteDoctor(String id);
  Future<void> createTimeSlot(Map<String, dynamic> slotData);
  Future<List<dynamic>> getTimeSlots();
}
