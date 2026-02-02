import 'package:go_router/go_router.dart';
import '../models/doctor.dart';
import '../screens/onboarding/onboarding_page.dart';
import '../screens/onboarding/login_page.dart';
import '../screens/patient/patient_dashboard.dart';
import '../screens/doctor/doctor_dashboard.dart';
import '../screens/nurse/nurse_dashboard.dart';
import '../screens/registration/registration_step1_page.dart';
import '../screens/pharmacy/pharmacy_page.dart';
import '../screens/lab/lab_tests_page.dart';
import '../screens/ambulance/request_ambulance_page.dart';
import '../screens/health_records/health_records_page.dart';
import '../screens/chat/ai_assistant_page.dart';
import '../screens/consultation/video_call_page.dart';
import '../screens/doctor/doctor_details_page.dart';
import '../screens/patient/doctor_selection_page.dart';
import '../screens/notifications/notifications_page.dart';
import '../screens/onboarding/forgot_password_page.dart';
import '../screens/profile/edit_profile_page.dart';
import '../screens/pharmacy/staff/pharmacy_inventory_page.dart';
import '../screens/pharmacy/staff/pharmacy_orders_page.dart';
import '../screens/pharmacy/admin/pharmacy_admin_dashboard.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/dashboard',
        name: 'dashboard',
        builder: (context, state) => const PatientDashboard(),
      ),
      GoRoute(
        path: '/dashboard/doctor',
        name: 'doctor_dashboard',
        builder: (context, state) => const DoctorDashboard(),
      ),
      GoRoute(
        path: '/dashboard/nurse',
        name: 'nurse_dashboard',
        builder: (context, state) => const NurseDashboard(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegistrationStep1Page(),
      ),
      GoRoute(
        path: '/pharmacy',
        name: 'pharmacy',
        builder: (context, state) => const PharmacyPage(),
      ),
      GoRoute(
        path: '/lab-tests',
        name: 'lab_tests',
        builder: (context, state) => const LabTestsPage(),
      ),
      GoRoute(
        path: '/ambulance',
        name: 'ambulance',
        builder: (context, state) => const RequestAmbulancePage(),
      ),
      GoRoute(
        path: '/health-records',
        name: 'health_records',
        builder: (context, state) => const HealthRecordsPage(),
      ),
      GoRoute(
        path: '/ai-assistant',
        name: 'ai_assistant',
        builder: (context, state) => const AIAssistantPage(),
      ),

      GoRoute(
        path: '/consultation',
        name: 'consultation',
        builder: (context, state) => const DoctorSelectionPage(),
      ),
      GoRoute(
        path: '/doctor-details',
        name: 'doctor_details',
        builder: (context, state) {
           final extra = state.extra as Map<String, dynamic>? ?? {};
           // Handle case where doctor object might be passed directly or constructed from ID (not implemented yet, assuming object passed)
           final doctor = extra['doctor'] as Doctor;
          return DoctorDetailsPage(
            doctor: doctor,
          );
        },
      ),
      GoRoute(
        path: '/video-call',
        name: 'video_call',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return VideoCallPage(
            doctorName: extra['doctorName'] ?? 'Dr. Sarah Smith',
            specialty: extra['specialty'] ?? 'Cardiologist',
          );
        },
      ),
      GoRoute(
        path: '/notifications',
        name: 'notifications',
        builder: (context, state) => const NotificationsPage(),
      ),
      GoRoute(
        path: '/forgot-password',
        name: 'forgot_password',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: '/profile/edit',
        name: 'edit_profile',
        builder: (context, state) => const EditProfilePage(),
      ),
      GoRoute(
        path: '/pharmacy/inventory',
        name: 'pharmacy_inventory',
        builder: (context, state) => const PharmacyInventoryPage(),
      ),
      GoRoute(
        path: '/pharmacy/orders',
        name: 'pharmacy_orders',
        builder: (context, state) => const PharmacyOrdersPage(),
      ),
      GoRoute(
        path: '/pharmacy/admin',
        name: 'pharmacy_admin',
        builder: (context, state) => const PharmacyAdminDashboard(),
      ),
    ],
  );
}
