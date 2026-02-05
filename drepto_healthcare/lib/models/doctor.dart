class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String hospital;
  final double rating;
  final int reviews;
  final int patients;
  final String about;
  final String imageUrl;
  final List<String> availableSlots;
  final double videoConsultationFee;
  final double clinicVisitFee;
  final bool isOnline;

  const Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.hospital,
    required this.rating,
    required this.reviews,
    required this.patients,
    required this.about,
    required this.imageUrl,
    required this.availableSlots,
    required this.videoConsultationFee,
    required this.clinicVisitFee,
    this.isOnline = false,
  });

  // Returns empty list - in production, this would fetch from backend API
  static List<Doctor> getMockDoctors() {
    return [];
  }
}
