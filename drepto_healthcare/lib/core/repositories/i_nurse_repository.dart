import 'package:drepto_healthcare/models/nurse.dart';

abstract class INurseRepository {
  Future<Map<String, dynamic>> register({
    required String firstName,
    required String lastName,
    required int mobileNumber,
    required String gender,
    required String licenseNumber,
    required String role,
    required String specification,
    required String availiability,
    required bool isAvailable,
    required int experienceYears,
    required String password,
    required List<String> serviceTypes,
  });

  Future<Map<String, dynamic>> login({
    required int mobileNumber,
    required String password,
  });

  Future<List<Nurse>> getAllNurses();
  Future<Nurse> getNurseById(String id);
  Future<void> updateNurse(String id, Map<String, dynamic> data);
  Future<void> deleteNurse(String id);
}
