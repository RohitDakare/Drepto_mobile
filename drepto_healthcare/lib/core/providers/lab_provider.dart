import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:drepto_healthcare/models/lab.dart';
import 'package:drepto_healthcare/core/repositories/i_lab_repository.dart';

@lazySingleton
class LabProvider extends ChangeNotifier {
  final ILabRepository _labRepository;

  LabProvider(this._labRepository);

  List<LabCenter> _labCenters = [];
  List<LabBooking> _bookings = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<LabCenter> get labCenters => _labCenters;
  List<LabBooking> get bookings => _bookings;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchLabCenters() async {
    _isLoading = true;
    notifyListeners();
    try {
      _labCenters = await _labRepository.getAllLabCenters();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchBookings() async {
    _isLoading = true;
    notifyListeners();
    try {
      _bookings = await _labRepository.getAllLabTestBookings();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
