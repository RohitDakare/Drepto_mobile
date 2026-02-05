import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/providers/auth_provider.dart';
import '../../core/services/auth_service.dart';
import '../../core/services/appointment_service.dart';
import '../../models/user_model.dart';
import '../../models/appointment.dart';
import '../../widgets/container/glass_container.dart';
import '../../widgets/navigation/bottom_nav_bars.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _currentIndex = 0;
  bool _isLoading = true;
  Map<String, int> _userStats = {
    'total': 0,
    'patients': 0,
    'doctors': 0,
    'nurses': 0,
    'pharmacy': 0,
  };
  List<Appointment> _appointments = [];
  List<UserModel> _users = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final stats = await AuthService.getUserStats();
      final users = await AuthService.getAllUsers();
      final appointments = await AppointmentService.getAllAppointments();

      if (mounted) {
        setState(() {
          _userStats = stats;
          _users = users;
          _appointments = appointments;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load data: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentIndex == 1) {
      return _buildUsersList();
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: _isLoading 
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Admin Dashboard',
                          style: AppTextStyles.h2,
                        ),
                        Text(
                          'Overview & Management',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary.withValues(alpha: 0.1),
                        border: Border.all(
                          color: AppColors.primary.withValues(alpha: 0.2),
                          width: 2,
                        ),
                      ),
                      child: const Icon(Icons.admin_panel_settings, color: AppColors.primary),
                    ),
                  ],
                ),
              ),
            ),

            // Stats Overview
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Platform Stats', style: AppTextStyles.h4),
                    const SizedBox(height: 12),
                    GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.5,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _StatsCard(
                          title: 'Total Users', // Renamed from Patients
                          value: '${_userStats['total']}',
                          icon: Icons.people,
                          color: AppColors.primary,
                          trend: 'Active',
                        ),
                        _StatsCard(
                          title: 'Appointments',
                          value: '${_appointments.length}',
                          icon: Icons.calendar_today,
                          color: AppColors.accent,
                          trend: 'Booked',
                        ),
                        _StatsCard(
                          title: 'Active Doctors',
                          value: '${_userStats['doctors']}',
                          icon: Icons.medical_services,
                          color: Colors.orange,
                          trend: 'Registered',
                        ),
                        _StatsCard(
                          title: 'Patients',
                          value: '${_userStats['patients']}',
                          icon: Icons.personal_injury, // Changed icon
                          color: Colors.green,
                          trend: 'Total',
                        ),
                      ].animate(interval: 100.ms).fadeIn(duration: 400.ms).scale(begin: const Offset(0.95, 0.95), curve: Curves.easeOut),
                    ),
                  ],
                ),
              ),
            ),

            // Quick Actions
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Quick Actions', style: AppTextStyles.h4),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _QuickActionCard(
                            title: 'Refresh Data',
                            icon: Icons.refresh,
                            color: AppColors.primary,
                            onTap: _loadData,
                          ),
                          _QuickActionCard(
                            title: 'Reports',
                            icon: Icons.bar_chart,
                            color: AppColors.accent,
                            onTap: () {},
                          ),
                          _QuickActionCard(
                            title: 'Settings',
                            icon: Icons.settings,
                            color: Colors.grey,
                            onTap: () {},
                          ),
                        ].animate(interval: 100.ms).fadeIn(duration: 400.ms).slideX(begin: 0.1, curve: Curves.easeOut),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Recent Activity (Real Data)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
                child: GlassContainer(
                  padding: const EdgeInsets.all(16),
                  color: Colors.white,
                  borderGradient: LinearGradient(
                    colors: [
                      AppColors.borderLight,
                      AppColors.borderLight.withValues(alpha: 0.5),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Recent User Registrations', style: AppTextStyles.h5),
                      const SizedBox(height: 16),
                      if (_users.isEmpty)
                         const Text('No recent activity'),
                      ..._users.take(5).map((user) => _ActivityItem(
                        text: 'New ${user.roleDisplayName}: ${user.name}',
                        time: 'Just now', // Ideally calculate from created_at
                        icon: Icons.person_add_alt_1,
                        color: Colors.green,
                      )),
                    ].animate(interval: 150.ms).fadeIn(duration: 500.ms),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
             if (index == 2) {
                 // Settings or Profile
             } 
             setState(() => _currentIndex = index);
        },
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Users'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  Widget _buildUsersList() {
      return Scaffold(
          appBar: AppBar(title: const Text('All Users'), leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => setState(() => _currentIndex = 0))),
          body: _isLoading 
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _users.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                    final user = _users[index];
                    return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                            leading: CircleAvatar(child: Text(user.name[0])),
                            title: Text(user.name, style: AppTextStyles.bodyLarge),
                            subtitle: Text('${user.email}\n${user.roleDisplayName}'),
                            isThreeLine: true,
                            trailing: Chip(label: Text(user.role.name)),
                        ),
                    );
                },
            ),
             bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) => setState(() => _currentIndex = index),
                selectedItemColor: AppColors.primary,
                unselectedItemColor: AppColors.textSecondary,
                items: const [
                BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
                BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Users'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
                ],
            ),
      );
  }
}

class _StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String trend;

  const _StatsCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.trend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppSpacing.borderRadiusMd,
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 20, color: color),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  trend,
                  style: AppTextStyles.caption.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: AppTextStyles.h4.copyWith(fontSize: 22),
              ),
              Text(
                title,
                style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.05),
          borderRadius: AppSpacing.borderRadiusMd,
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              style: AppTextStyles.labelMedium.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final String text;
  final String time;
  final IconData icon;
  final Color color;

  const _ActivityItem({
    required this.text,
    required this.time,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: color.withValues(alpha: 0.1),
          child: Icon(icon, size: 16, color: color),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text, style: AppTextStyles.bodyMedium),
              Text(time, style: AppTextStyles.caption),
            ],
          ),
        ),
      ],
    );
  }
}
