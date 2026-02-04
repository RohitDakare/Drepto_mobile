import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../widgets/loading/loading_indicators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/cards/app_cards.dart';
import '../../widgets/inputs/app_inputs.dart';
import 'patient_schedule_page.dart';
import '../../widgets/navigation/bottom_nav_bars.dart';
import '../profile/profile_page.dart';

import '../chat/ai_assistant_page.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  int _currentIndex = 0;

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
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello, User', style: AppTextStyles.h4),
                        Text(
                          'How are you feeling today?',
                          style: AppTextStyles.caption,
                        ),
                      ],
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

          // Search Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: AppSearchField(
                hint: 'Search medicines, doctors, or tests',
                onTap: () {
                  // Navigate to search page
                },
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
                  const Text('Our Services', style: AppTextStyles.h4),
                  const SizedBox(height: 12),
                  GridView.count(
                    crossAxisCount: (MediaQuery.of(context).size.width / 180).floor().clamp(2, 4),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.3,
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
                    ],
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
                      const Text('Upcoming Appointments',
                          style: AppTextStyles.h4),
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
                  Container(
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
                  const Text('Recent Orders', style: AppTextStyles.h4),
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

class _MessagesPage extends StatelessWidget {
  const _MessagesPage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Messages', style: AppTextStyles.h2),
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: AppSpacing.borderRadiusFull,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.smart_toy, color: Colors.white),
                    onPressed: () {
                      context.pushNamed('ai_assistant');
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Chat with doctors and get support',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            // AI Assistant card
            GestureDetector(
              onTap: () {
                context.pushNamed('ai_assistant');
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: AppSpacing.borderRadiusMd,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.smart_toy,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Drepto AI Assistant',
                            style: AppTextStyles.labelLarge.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Get instant health answers 24/7',
                            style: AppTextStyles.caption.copyWith(
                              color: Colors.white.withValues(alpha: 0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: AppSpacing.borderRadiusFull,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.chat_bubble_outline,
                      size: 80,
                      color: AppColors.gray300,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No messages yet',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
