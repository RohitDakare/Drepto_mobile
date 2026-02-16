import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/providers/auth_provider.dart';
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
import '../screens/profile/change_password_page.dart';
import '../screens/profile/privacy_policy_page.dart';
import '../screens/pharmacy/staff/pharmacy_inventory_page.dart';
import '../screens/pharmacy/staff/pharmacy_orders_page.dart';
import '../screens/pharmacy/admin/pharmacy_admin_dashboard.dart';
import '../screens/admin/admin_dashboard.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter createRouter(AuthProvider authProvider) {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/',
      refreshListenable: authProvider,
      redirect: (BuildContext context, GoRouterState state) {
        final authStatus = authProvider.status;
        final isAuthenticated = authProvider.isAuthenticated;
        final currentPath = state.uri.path;

        // List of protected routes that require authentication
        final protectedRoutes = [
          '/dashboard',
          '/dashboard/doctor',
          '/dashboard/nurse',
          '/pharmacy',
          '/pharmacy/admin',
          '/pharmacy/inventory',
          '/pharmacy/orders',
          '/lab-tests',
          '/ambulance',
          '/health-records',
          '/ai-assistant',
          '/consultation',
          '/doctor-details',
          '/video-call',
          '/notifications',
          '/profile/edit',
          '/dashboard/admin',
        ];

        // If auth status is unknown, wait for it to be determined
        if (authStatus == AuthStatus.unknown) {
          return null;
        }

        // If user is not authenticated and trying to access protected route
        if (!isAuthenticated &&
            protectedRoutes.any((route) => currentPath.startsWith(route))) {
          return '/login';
        }

        // If user is authenticated and trying to access login/onboarding
        if (isAuthenticated &&
            (currentPath == '/login' ||
                currentPath == '/' ||
                currentPath == '/register')) {
          return authProvider.getDashboardRoute();
        }

        // No redirect needed
        return null;
      },
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
          path: '/register',
          name: 'register',
          builder: (context, state) => const RegistrationStep1Page(),
        ),
        GoRoute(
          path: '/forgot-password',
          name: 'forgot_password',
          builder: (context, state) => const ForgotPasswordPage(),
        ),
        // Protected routes below
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
          path: '/dashboard/admin',
          name: 'admin_dashboard',
          builder: (context, state) => const AdminDashboard(),
        ),
        GoRoute(
          path: '/pharmacy',
          name: 'pharmacy',
          builder: (context, state) => const PharmacyPage(),
        ),
        GoRoute(
          path: '/pharmacy/admin',
          name: 'pharmacy_admin',
          builder: (context, state) => const PharmacyAdminDashboard(),
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
            final doctor = extra['doctor'] as Doctor;
            return DoctorDetailsPage(doctor: doctor);
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
          path: '/profile/edit',
          name: 'edit_profile',
          builder: (context, state) => const EditProfilePage(),
        ),
        GoRoute(
          path: '/profile/change-password',
          name: 'change_password',
          builder: (context, state) => const ChangePasswordPage(),
        ),
        GoRoute(
          path: '/profile/privacy-policy',
          name: 'privacy_policy',
          builder: (context, state) => const PrivacyPolicyPage(),
        ),
      ],
    );
  }

  // Legacy router getter for backward compatibility
  static late final GoRouter router;

  static void initialize(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    router = createRouter(authProvider);
  }
}
