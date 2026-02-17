import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:drepto_healthcare/models/doctor.dart';
import 'package:drepto_healthcare/core/repositories/i_doctor_repository.dart';

@lazySingleton
class DoctorProvider extends ChangeNotifier {
  final IDoctorRepository _doctorRepository;

  DoctorProvider(this._doctorRepository);

  List<Doctor> _doctors = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Doctor> get doctors => _doctors;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchDoctors() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _doctors = await _doctorRepository.getAllDoctors();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addDoctor(Doctor doctor) async {
    try {
      await _doctorRepository.createDoctor(doctor);
      await fetchDoctors();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }
}
