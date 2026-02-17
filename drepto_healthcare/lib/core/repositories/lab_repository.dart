import 'package:injectable/injectable.dart';
import 'package:drepto_healthcare/core/network/api_service.dart';
import 'package:drepto_healthcare/models/lab.dart';
import 'package:drepto_healthcare/core/repositories/i_lab_repository.dart';

@LazySingleton(as: ILabRepository)
class LabRepository implements ILabRepository {
  @override
  Future<void> createLabCenter(LabCenter labCenter) async {
    await ApiService.post('/lab-center', data: labCenter.toJson());
  }

  @override
  Future<List<LabCenter>> getAllLabCenters() async {
    final response = await ApiService.get('/lab-center');
    final data = response.data as List<dynamic>;
    return data.map((json) => LabCenter.fromJson(json)).toList();
  }

  @override
  Future<LabCenter> getLabCenterById(String id) async {
    final response = await ApiService.get('/lab-center/$id');
    return LabCenter.fromJson(response.data);
  }

  @override
  Future<void> bookLabTest(LabBooking booking) async {
    await ApiService.post('/lab-test-booking', data: booking.toJson());
  }

  @override
  Future<List<LabBooking>> getAllLabTestBookings() async {
    final response = await ApiService.get('/lab-test-booking');
    final data = response.data as List<dynamic>;
    return data.map((json) => LabBooking.fromJson(json)).toList();
  }

  @override
  Future<void> createLabSlot(Map<String, dynamic> slotData) async {
    await ApiService.post('/lab-slot', data: slotData);
  }

  @override
  Future<List<dynamic>> getAllLabSlots() async {
    final response = await ApiService.get('/lab-slot');
    return response.data as List<dynamic>;
  }
}
