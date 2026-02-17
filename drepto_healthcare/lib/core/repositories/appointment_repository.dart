import 'package:injectable/injectable.dart';
import 'package:drepto_healthcare/core/network/api_service.dart';
import 'package:drepto_healthcare/models/appointment.dart';
import 'package:drepto_healthcare/core/repositories/i_appointment_repository.dart';

@LazySingleton(as: IAppointmentRepository)
class AppointmentRepository implements IAppointmentRepository {
  @override
  Future<void> bookGeneralAppointment(Appointment appointment) async {
    await ApiService.post('/appointments', data: appointment.toJson());
  }

  @override
  Future<List<Appointment>> getAppointmentsByUserId(String userId) async {
    final response = await ApiService.get('/appointments/$userId');
    final data = response.data as List<dynamic>;
    return data.map((json) => Appointment.fromJson(json)).toList();
  }

  @override
  Future<void> createNurseAppointment(Map<String, dynamic> data) async {
    await ApiService.post('/nurse-appointment', data: data);
  }

  @override
  Future<List<dynamic>> getAllNurseAppointments() async {
    final response = await ApiService.get('/nurse-appointment');
    return response.data as List<dynamic>;
  }

  @override
  Future<dynamic> getNurseAppointmentById(String id) async {
    final response = await ApiService.get('/nurse-appointment/$id');
    return response.data;
  }

  @override
  Future<void> updateNurseAppointment(
      String id, Map<String, dynamic> data) async {
    await ApiService.post('/nurse-appointment/$id', data: data);
  }

  @override
  Future<void> deleteNurseAppointment(String id) async {
    // Implement delete in ApiService
  }

  @override
  Future<void> createDoctorAppointment(Map<String, dynamic> data) async {
    await ApiService.post('/doctor-appointment', data: data);
  }

  @override
  Future<List<dynamic>> getAllDoctorAppointments() async {
    final response = await ApiService.get('/doctor-appointment');
    return response.data as List<dynamic>;
  }

  @override
  Future<dynamic> getDoctorAppointmentById(String id) async {
    final response = await ApiService.get('/doctor-appointment/$id');
    return response.data;
  }

  @override
  Future<void> updateDoctorAppointment(
      String id, Map<String, dynamic> data) async {
    await ApiService.post('/doctor-appointment/$id', data: data);
  }

  @override
  Future<void> deleteDoctorAppointment(String id) async {
    // Implement delete in ApiService
  }
}
