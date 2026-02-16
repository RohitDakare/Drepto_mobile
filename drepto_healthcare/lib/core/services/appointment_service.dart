import 'package:drepto_healthcare/models/appointment.dart';

class AppointmentService {
  // In-memory appointments list
  static final List<Appointment> _appointments = [];

  // Initialize with some mock data if empty
  static Future<void> initialize() async {
    if (_appointments.isEmpty) {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));
      _appointments.addAll(Appointment.getMockAppointments());
    }
  }

  // Get upcoming appointments
  static Future<List<Appointment>> getUpcomingAppointments() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));
    
    // Sort by date soonest first
    _appointments.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    
    final now = DateTime.now();
    return _appointments.where((apt) => 
      apt.dateTime.isAfter(now) && 
      apt.status != AppointmentStatus.cancelled
    ).toList();
  }

  // Get past appointments
  static Future<List<Appointment>> getPastAppointments() async {
    await Future.delayed(const Duration(milliseconds: 800));
    
    final now = DateTime.now();
    return _appointments.where((apt) => 
      apt.dateTime.isBefore(now) || 
      apt.status == AppointmentStatus.completed
    ).toList();
  }

  // Book new appointment
  static Future<Appointment> bookAppointment({
    required String doctorId,
    required String doctorName,
    required String specialty,
    required DateTime dateTime,
    required AppointmentType type,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    final newAppointment = Appointment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      doctorId: doctorId,
      doctorName: doctorName,
      specialty: specialty,
      hospitalName: 'City Hospital', // This would come from doctor details
      dateTime: dateTime,
      type: type,
      status: AppointmentStatus.upcoming,
      zoomLink: type == AppointmentType.online ? 'https://zoom.us/j/generated-link' : null,
      location: type == AppointmentType.inPerson ? '123 Medical Lane' : null,
    );

    _appointments.add(newAppointment);
    return newAppointment;
  }

  // Cancel appointment
  static Future<void> cancelAppointment(String appointmentId) async {
    await Future.delayed(const Duration(seconds: 1));
    
    final index = _appointments.indexWhere((a) => a.id == appointmentId);
    if (index != -1) {
      // Create cancelled copy
      final cancelled = Appointment(
        id: _appointments[index].id,
        doctorId: _appointments[index].doctorId,
        doctorName: _appointments[index].doctorName,
        specialty: _appointments[index].specialty,
        hospitalName: _appointments[index].hospitalName,
        dateTime: _appointments[index].dateTime,
        type: _appointments[index].type,
        status: AppointmentStatus.cancelled,
        zoomLink: _appointments[index].zoomLink,
        location: _appointments[index].location,
      );
      
      _appointments[index] = cancelled;
    }
  }

  /// Get all appointments (for Admin Dashboard)
  static Future<List<Appointment>> getAllAppointments() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List.from(_appointments);
  }
}

