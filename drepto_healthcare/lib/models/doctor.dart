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

  // Mock Data Generator
  static List<Doctor> getMockDoctors() {
    return [
      const Doctor(
        id: '1',
        name: 'Dr. Sarah Smith',
        specialty: 'Cardiologist',
        hospital: 'City Heart Center',
        rating: 4.8,
        reviews: 120,
        patients: 1500,
        about:
            'Dr. Sarah Smith is a highly experienced Cardiologist with over 10 years of practice. She specializes in heart health, preventive cardiology, and hypertension management.',
        imageUrl: 'assets/images/doctor1.png',
        availableSlots: [
          '09:00 AM',
          '10:00 AM',
          '02:00 PM',
          '04:00 PM',
          '06:00 PM'
        ],
        videoConsultationFee: 50.0,
        clinicVisitFee: 80.0,
        isOnline: true,
      ),
      const Doctor(
        id: '2',
        name: 'Dr. James Wilson',
        specialty: 'Dentist',
        hospital: 'Smile Dental Clinic',
        rating: 4.9,
        reviews: 85,
        patients: 900,
        about:
            'Dr. James Wilson is a renowned Dentist known for his gentle approach and expertise in cosmetic dentistry and oral surgery.',
        imageUrl: 'assets/images/doctor2.png',
        availableSlots: ['09:30 AM', '11:00 AM', '03:00 PM', '05:30 PM'],
        videoConsultationFee: 40.0,
        clinicVisitFee: 70.0,
        isOnline: false,
      ),
      const Doctor(
        id: '3',
        name: 'Dr. Emily Chen',
        specialty: 'Pediatrician',
        hospital: 'Childrens Hope Hospital',
        rating: 4.7,
        reviews: 200,
        patients: 2500,
        about:
            'Dr. Emily Chen is a caring Pediatrician dedicated to the well-being of children. She has extensive experience in child development and pediatric illnesses.',
        imageUrl: 'assets/images/doctor3.png',
        availableSlots: ['08:00 AM', '10:30 AM', '01:00 PM'],
        videoConsultationFee: 45.0,
        clinicVisitFee: 75.0,
        isOnline: true,
      ),
      const Doctor(
        id: '4',
        name: 'Dr. Michael Brown',
        specialty: 'Neurologist',
        hospital: 'Brain & Spine Institute',
        rating: 4.9,
        reviews: 150,
        patients: 1200,
        about:
            'Dr. Michael Brown is a leading Neurologist specializing in stroke recovery, migraines, and nervous system disorders.',
        imageUrl: 'assets/images/doctor4.png',
        availableSlots: ['11:00 AM', '02:00 PM', '05:00 PM'],
        videoConsultationFee: 60.0,
        clinicVisitFee: 100.0,
        isOnline: false,
      ),
      const Doctor(
        id: '5',
        name: 'Dr. Lisa Wong',
        specialty: 'Dermatologist',
        hospital: 'Skin Care Clinic',
        rating: 4.6,
        reviews: 95,
        patients: 1100,
        about:
            'Dr. Lisa Wong is an expert Dermatologist focusing on skincare, acne treatment, and anti-aging procedures.',
        imageUrl: 'assets/images/doctor5.png',
        availableSlots: ['10:00 AM', '12:00 PM', '03:30 PM'],
        videoConsultationFee: 55.0,
        clinicVisitFee: 90.0,
        isOnline: true,
      ),
    ];
  }
}
