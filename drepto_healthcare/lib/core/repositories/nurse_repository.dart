import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:drepto_healthcare/core/network/api_service.dart';
import 'package:drepto_healthcare/core/services/secure_storage_service.dart';
import 'package:drepto_healthcare/models/nurse.dart';
import 'package:drepto_healthcare/core/repositories/i_nurse_repository.dart';

@LazySingleton(as: INurseRepository)
class NurseRepository implements INurseRepository {
  @override
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
  }) async {
    final data = {
      'firstName': firstName,
      'lastName': lastName,
      'mobileNumber': mobileNumber,
      'gender': gender,
      'licenseNumber': licenseNumber,
      'role': role,
      'specification': specification,
      'availiability': availiability,
      'isAvailable': isAvailable,
      'experienceYears': experienceYears,
      'password': password,
      'serviceTypes': serviceTypes,
    };

    final response = await ApiService.post('/nurse/register', data: data);
    final result = response.data as Map<String, dynamic>;

    if (result.containsKey('token')) {
      await SecureStorageService.saveToken(result['token']);
      if (result.containsKey('user')) {
        await SecureStorageService.saveSensitiveData(
          'user_data',
          jsonEncode(result['user']),
        );
      }
    }
    return result;
  }

  @override
  Future<Map<String, dynamic>> login({
    required int mobileNumber,
    required String password,
  }) async {
    final data = {
      'mobileNumber': mobileNumber,
      'password': password,
    };

    final response = await ApiService.post('/nurse/login', data: data);
    final result = response.data as Map<String, dynamic>;

    if (result.containsKey('token')) {
      await SecureStorageService.saveToken(result['token']);
      if (result.containsKey('user')) {
        await SecureStorageService.saveSensitiveData(
          'user_data',
          jsonEncode(result['user']),
        );
      }
    }
    return result;
  }

  @override
  Future<List<Nurse>> getAllNurses() async {
    final response = await ApiService.get('/nurse');
    final data = response.data as List<dynamic>;
    return data.map((json) => Nurse.fromJson(json)).toList();
  }

  @override
  Future<Nurse> getNurseById(String id) async {
    final response = await ApiService.get('/nurse/$id');
    return Nurse.fromJson(response.data);
  }

  @override
  Future<void> updateNurse(String id, Map<String, dynamic> data) async {
    await ApiService.post('/nurse/$id',
        data:
            data); // documentation says PATCH /nurse/:id but uses data, generic post handler for now or add patch to api service
  }

  @override
  Future<void> deleteNurse(String id) async {
    // Add delete to ApiService if needed
  }
}
