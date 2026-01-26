import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../widgets/navigation/bottom_nav_bars.dart';
import 'doctor_schedule_page.dart';
import 'doctor_patients_page.dart';
import 'doctor_messages_page.dart';
import 'doctor_settings_page.dart';

class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({super.key});

  @override
  State<DoctorDashboard> createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const _DoctorHomePage(),
    const DoctorSchedulePage(),
    const DoctorPatientsPage(),
    const DoctorMessagesPage(),
    const DoctorSettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: DoctorBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

class _DoctorHomePage extends StatelessWidget {
  const _DoctorHomePage();

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
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        width: 2,
                      ),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://randomuser.me/api/portraits/men/75.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning, Dr. Smith',
                          style: AppTextStyles.h4,
                        ),
                        Text('Monday, Oct 24', style: AppTextStyles.caption),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Stats Cards
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      icon: Icons.people,
                      label: 'PATIENTS',
                      value: '24',
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      icon: Icons.check_circle_outline,
                      label: 'COMPLETED',
                      value: '12',
                      color: AppColors.accent,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      icon: Icons.pending_actions,
                      label: 'PENDING',
                      value: '5',
                      color: AppColors.warning,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Today's Schedule
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Today's Schedule", style: AppTextStyles.h4),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: AppTextStyles.labelMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 100),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                _AppointmentItem(
                  patientName: 'Sarah Jenkins',
                  time: '09:30 AM',
                  type: 'Routine Checkup',
                  imageUrl: 'https://randomuser.me/api/portraits/women/21.jpg',
                  actionLabel: 'Start Call',
                  actionColor: AppColors.primary,
                ),
                SizedBox(height: 8),
                _AppointmentItem(
                  patientName: 'Michael Chen',
                  time: '10:15 AM',
                  type: 'Lab Review',
                  imageUrl: 'https://randomuser.me/api/portraits/men/22.jpg',
                  actionLabel: 'Join Now',
                  actionColor: AppColors.accent,
                  isActive: true,
                ),
                SizedBox(height: 8),
                _AppointmentItem(
                  patientName: 'Emily Rodriguez',
                  time: '11:00 AM',
                  type: 'Follow-up',
                  imageUrl: 'https://randomuser.me/api/portraits/women/45.jpg',
                  actionLabel: 'View Chart',
                  actionColor: AppColors.gray600,
                  isOutlined: true,
                ),
                SizedBox(height: 8),
                _AppointmentItem(
                  patientName: 'David Thompson',
                  time: '01:45 PM',
                  type: 'Consultation',
                  imageUrl: 'https://randomuser.me/api/portraits/men/55.jpg',
                  actionLabel: 'View Chart',
                  actionColor: AppColors.gray600,
                  isOutlined: true,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: AppSpacing.borderRadiusMd,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            label,
            style: AppTextStyles.overline.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyles.h3.copyWith(color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}

class _AppointmentItem extends StatelessWidget {
  final String patientName;
  final String time;
  final String type;
  final String imageUrl;
  final String actionLabel;
  final Color actionColor;
  final bool isActive;
  final bool isOutlined;

  const _AppointmentItem({
    required this.patientName,
    required this.time,
    required this.type,
    required this.imageUrl,
    required this.actionLabel,
    required this.actionColor,
    this.isActive = false,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primary.withValues(alpha: 0.05)
            : AppColors.surfaceLight,
        borderRadius: AppSpacing.borderRadiusMd,
        border: Border.all(
          color: isActive
              ? AppColors.primary.withValues(alpha: 0.3)
              : AppColors.borderLight,
        ),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (isActive)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  patientName,
                  style: AppTextStyles.labelLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 12,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text('$time • $type', style: AppTextStyles.caption),
                  ],
                ),
              ],
            ),
          ),
          isOutlined
              ? OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: actionColor,
                    side: BorderSide(color: actionColor),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    minimumSize: const Size(0, 36),
                  ),
                  child: Text(actionLabel),
                )
              : ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: actionColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    minimumSize: const Size(0, 36),
                    elevation: 0,
                  ),
                  child: Text(actionLabel),
                ),
        ],
      ),
    );
  }
}
