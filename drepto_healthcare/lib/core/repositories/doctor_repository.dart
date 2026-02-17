import 'package:injectable/injectable.dart';
import 'package:drepto_healthcare/core/network/api_service.dart';
import 'package:drepto_healthcare/models/doctor.dart';
import 'package:drepto_healthcare/core/repositories/i_doctor_repository.dart';

@LazySingleton(as: IDoctorRepository)
class DoctorRepository implements IDoctorRepository {
  @override
  Future<void> createDoctor(Doctor doctor) async {
    await ApiService.post('/doctor', data: doctor.toJson());
  }

  @override
  Future<List<Doctor>> getAllDoctors() async {
    final response = await ApiService.get('/doctor');
    final data = response.data as List<dynamic>;
    return data.map((json) => Doctor.fromJson(json)).toList();
  }

  @override
  Future<Doctor> getDoctorById(String id) async {
    final response = await ApiService.get('/doctor/$id');
    return Doctor.fromJson(response.data);
  }

  @override
  Future<void> updateDoctor(String id, Map<String, dynamic> data) async {
    await ApiService.post('/doctor/$id', data: data);
  }

  @override
  Future<void> deleteDoctor(String id) async {
    // Implement delete in ApiService first
  }

  @override
  Future<void> createTimeSlot(Map<String, dynamic> slotData) async {
    await ApiService.post('/doctor-timeslot', data: slotData);
  }

  @override
  Future<List<dynamic>> getTimeSlots() async {
    final response = await ApiService.get('/doctor-timeslot');
    return response.data as List<dynamic>;
  }
}
