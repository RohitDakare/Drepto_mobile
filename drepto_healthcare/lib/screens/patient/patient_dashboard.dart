import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:drepto_healthcare/core/constants/app_colors.dart';
import 'package:drepto_healthcare/core/constants/app_spacing.dart';
import 'package:drepto_healthcare/core/constants/app_text_styles.dart';
import 'package:drepto_healthcare/core/providers/auth_provider.dart';
import 'package:drepto_healthcare/core/utils/greeting_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:drepto_healthcare/widgets/cards/app_cards.dart';
import 'package:drepto_healthcare/widgets/cards/appointment_card.dart';
import 'patient_schedule_page.dart';
import 'package:drepto_healthcare/widgets/navigation/bottom_nav_bars.dart';
import '../profile/profile_page.dart';

import '../chat/ai_assistant_page.dart';
import 'package:drepto_healthcare/models/appointment.dart';
import 'package:drepto_healthcare/core/services/appointment_service.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Initialize appointment service
    AppointmentService.initialize();
  }

  final List<Widget> _pages = [
    const _PatientHomePage(),
    const PatientSchedulePage(),
    const AIAssistantPage(showBackButton: false),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: PatientBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

class _PatientHomePage extends StatelessWidget {
  const _PatientHomePage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: CustomScrollView(
        slivers: [
          // App Bar
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppColors.surfaceLight,
                border: Border(
                  bottom: BorderSide(color: AppColors.borderLight),
                ),
              ),
              child: Row(
                children: [
                  // User avatar
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        width: 2,
                      ),
                      color: AppColors.primary.withValues(alpha: 0.1),
                    ),
                    child: const Icon(Icons.person, color: AppColors.primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Consumer<AuthProvider>(
                      builder: (context, authProvider, child) {
                        final user = authProvider.currentUser;
                        final greeting = user != null
                            ? GreetingHelper.getPersonalizedGreeting(user.name)
                            : GreetingHelper.getTimeBasedGreeting();

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(greeting, style: AppTextStyles.h4),
                            Text(
                              'How are you feeling today?',
                              style: AppTextStyles.caption,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: AppColors.gray50,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.notifications_outlined),
                      color: AppColors.textPrimary,
                      iconSize: 22,
                      onPressed: () {
                        context.pushNamed('notifications');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Services Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Our Services', style: AppTextStyles.h4),
                  const SizedBox(height: 12),
                  GridView.count(
                    crossAxisCount: (MediaQuery.of(context).size.width / 180)
                        .floor()
                        .clamp(2, 4),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.85,
                    children: [
                      ServiceCard(
                        title: 'Doctor',
                        subtitle: 'Consult now',
                        icon: Icons.medical_services,
                        iconBackgroundColor:
                            AppColors.primary.withValues(alpha: 0.1),
                        iconColor: AppColors.primary,
                        onTap: () {
                          context.pushNamed('consultation');
                        },
                      ),
                      ServiceCard(
                        title: 'Medicines',
                        subtitle: 'Order pharmacy',
                        icon: Icons.medication,
                        iconBackgroundColor:
                            AppColors.accent.withValues(alpha: 0.1),
                        iconColor: AppColors.accent,
                        onTap: () {
                          context.pushNamed('pharmacy');
                        },
                      ),
                      ServiceCard(
                        title: 'Lab Tests',
                        subtitle: 'Book a test',
                        icon: Icons.science,
                        iconBackgroundColor:
                            AppColors.primary.withValues(alpha: 0.1),
                        iconColor: AppColors.primary,
                        onTap: () {
                          context.pushNamed('lab_tests');
                        },
                      ),
                      ServiceCard(
                        title: 'Nursing',
                        subtitle: 'At-home care',
                        icon: Icons.health_and_safety,
                        iconBackgroundColor:
                            AppColors.accent.withValues(alpha: 0.1),
                        iconColor: AppColors.accent,
                        onTap: () {},
                      ),
                      ServiceCard(
                        title: 'Ambulance',
                        subtitle: 'Emergency',
                        icon: Icons.emergency,
                        isEmergency: true,
                        onTap: () {
                          context.pushNamed('ambulance');
                        },
                      ),
                      ServiceCard(
                        title: 'Records',
                        subtitle: 'View history',
                        icon: Icons.description,
                        iconBackgroundColor:
                            AppColors.primary.withValues(alpha: 0.1),
                        iconColor: AppColors.primary,
                        onTap: () {
                          context.pushNamed('health_records');
                        },
                      ),
                    ].animate(interval: 100.ms).fadeIn(duration: 400.ms).scale(
                        begin: const Offset(0.8, 0.8),
                        curve: Curves.easeOutBack),
                  ),
                ],
              ),
            ),
          ),

          // Upcoming Appointments
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Upcoming Appointments', style: AppTextStyles.h4),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See all',
                          style: AppTextStyles.labelMedium.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  // Appointments List (Empty State for now)
                  // Appointments List
                  FutureBuilder<List<Appointment>>(
                    future: AppointmentService.getUpcomingAppointments(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return const Center(
                            child: Text('Error loading appointments'));
                      }

                      final appointments = snapshot.data ?? [];

                      if (appointments.isEmpty) {
                        return Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(24.w),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceLight,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: AppColors.borderLight),
                          ),
                          child: Center(
                            child: Text(
                              'No upcoming appointments',
                              style: AppTextStyles.bodyMedium
                                  .copyWith(color: AppColors.textSecondary),
                            ),
                          ),
                        );
                      }

                      return Column(
                        children: appointments
                            .take(3)
                            .map((appointment) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child:
                                      AppointmentCard(appointment: appointment),
                                ))
                            .toList()
                            .animate(interval: 200.ms)
                            .fadeIn(duration: 500.ms)
                            .slideX(begin: 0.2, curve: Curves.easeOut),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Recent Orders
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recent Orders', style: AppTextStyles.h4),
                  const SizedBox(height: 12),
                  // Empty State for Orders
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceLight,
                      borderRadius: AppSpacing.borderRadiusMd,
                      border: Border.all(color: AppColors.borderLight),
                    ),
                    child: Center(
                      child: Text(
                        'No recent orders',
                        style: AppTextStyles.bodyMedium
                            .copyWith(color: AppColors.textSecondary),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
