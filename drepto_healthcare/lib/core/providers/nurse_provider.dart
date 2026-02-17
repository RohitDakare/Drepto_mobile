import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:drepto_healthcare/models/nurse.dart';
import 'package:drepto_healthcare/core/repositories/i_nurse_repository.dart';

@lazySingleton
class NurseProvider extends ChangeNotifier {
  final INurseRepository _nurseRepository;

  NurseProvider(this._nurseRepository);

  List<Nurse> _nurses = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Nurse> get nurses => _nurses;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchNurses() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _nurses = await _nurseRepository.getAllNurses();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> registerNurse({
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
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _nurseRepository.register(
        firstName: firstName,
        lastName: lastName,
        mobileNumber: mobileNumber,
        gender: gender,
        licenseNumber: licenseNumber,
        role: role,
        specification: specification,
        availiability: availiability,
        isAvailable: isAvailable,
        experienceYears: experienceYears,
        password: password,
        serviceTypes: serviceTypes,
      );
      await fetchNurses(); // Refresh list
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
