import 'package:drepto_healthcare/models/lab.dart';

abstract class ILabRepository {
  Future<void> createLabCenter(LabCenter labCenter);
  Future<List<LabCenter>> getAllLabCenters();
  Future<LabCenter> getLabCenterById(String id);

  Future<void> bookLabTest(LabBooking booking);
  Future<List<LabBooking>> getAllLabTestBookings();

  Future<void> createLabSlot(Map<String, dynamic> slotData);
  Future<List<dynamic>> getAllLabSlots();
}
