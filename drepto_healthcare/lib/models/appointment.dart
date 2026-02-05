

enum AppointmentStatus {
  upcoming,
  completed,
  cancelled,
}

enum AppointmentType {
  online,
  inPerson,
}

class Appointment {
  final String id;
  final String doctorId;
  final String doctorName;
  final String specialty;
  final String hospitalName;
  final DateTime dateTime;
  final AppointmentType type;
  final AppointmentStatus status;
  final String? zoomLink;
  final String? location;

  const Appointment({
    required this.id,
    required this.doctorId,
    required this.doctorName,
    required this.specialty,
    required this.hospitalName,
    required this.dateTime,
    required this.type,
    this.status = AppointmentStatus.upcoming,
    this.zoomLink,
    this.location,
  });

  // Mock data generator
  static List<Appointment> getMockAppointments() {
    final now = DateTime.now();
    return [
      Appointment(
        id: '1',
        doctorId: '1',
        doctorName: 'Dr. Sarah Smith',
        specialty: 'Cardiologist',
        hospitalName: 'City Heart Center',
        dateTime: now.add(const Duration(days: 1, hours: 2)), // Tomorrow
        type: AppointmentType.online,
        zoomLink: 'https://zoom.us/j/123456789',
      ),
      Appointment(
        id: '2',
        doctorId: '2',
        doctorName: 'Dr. James Wilson',
        specialty: 'Dentist',
        hospitalName: 'Smile Dental Clinic',
        dateTime: now.add(const Duration(days: 3, hours: 5)), // In 3 days
        type: AppointmentType.inPerson,
        location: '123 Medical Lane, Health City',
      ),
      Appointment(
        id: '3',
        doctorId: '4', 
        doctorName: 'Dr. Michael Brown',
        specialty: 'Neurologist',
        hospitalName: 'Brain & Spine Institute',
        dateTime: now.add(const Duration(days: 5, hours: 1)), // In 5 days
        type: AppointmentType.online,
        zoomLink: 'https://zoom.us/j/987654321',
      ),
    ];
  }
}
