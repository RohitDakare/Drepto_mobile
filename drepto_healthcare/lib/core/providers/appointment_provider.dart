import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:drepto_healthcare/models/appointment.dart';
import 'package:drepto_healthcare/core/repositories/i_appointment_repository.dart';

@lazySingleton
class AppointmentProvider extends ChangeNotifier {
  final IAppointmentRepository _appointmentRepository;

  AppointmentProvider(this._appointmentRepository);

  List<Appointment> _appointments = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Appointment> get appointments => _appointments;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchUserAppointments(String userId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _appointments =
          await _appointmentRepository.getAppointmentsByUserId(userId);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> bookAppointment(Appointment appointment) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _appointmentRepository.bookGeneralAppointment(appointment);
      if (appointment.userId != null) {
        await fetchUserAppointments(appointment.userId!);
      }
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
