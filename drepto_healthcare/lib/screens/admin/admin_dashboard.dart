import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/services/auth_service.dart';
import '../../core/services/admin_service.dart';
import '../../models/user_model.dart';
import '../../widgets/container/glass_container.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  bool _isLoading = true;
  late TabController _tabController;

  // Data
  Map<String, int> _userStats = {'total': 0, 'patients': 0, 'doctors': 0};
  List<AdminActivityItem> _recentActivity = [];
  List<UserModel> _users = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final stats = await AuthService.getUserStats();
      final users = await AuthService.getAllUsers();
      final activity = await AdminService.getRecentActivity();

      if (mounted) {
        setState(() {
          _userStats = stats;
          _users = users;
          _recentActivity = activity;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        // Helper to avoid context usage if unmounted, but good for debug
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentIndex == 1) {
      return _buildFullUserList();
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Admin Dashboard', style: AppTextStyles.h2),
                        Text('Operations Center',
                            style: AppTextStyles.bodyMedium
                                .copyWith(color: AppColors.textSecondary)),
                      ],
                    ),
                    IconButton(
                        onPressed: _loadData,
                        icon: const Icon(Icons.refresh,
                            color: AppColors.primary)),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TabBar(
                controller: _tabController,
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.textSecondary,
                indicatorColor: AppColors.primary,
                tabs: const [
                  Tab(text: 'Overview'),
                  Tab(text: 'Medical'),
                  Tab(text: 'Logistics'),
                ],
              ),
            ),
          ],
          body: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : TabBarView(
                  controller: _tabController,
                  children: [
                    _buildOverviewTab(),
                    _buildMedicalTab(),
                    _buildLogisticsTab(),
                  ],
                ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Monitor'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Users'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatsGrid(),
          const SizedBox(height: 24),
          Text('Live Activity Feed', style: AppTextStyles.h4),
          const SizedBox(height: 12),
          ..._recentActivity.map((item) => _ActivityListTile(item: item)),
        ],
      ),
    );
  }

  Widget _buildMedicalTab() {
    final medicalActivity = _recentActivity
        .where((a) =>
            a.type == ActivityType.appointment ||
            a.type == ActivityType.registration)
        .toList();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        GlassContainer(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _MiniStat(label: 'Doctors', value: '${_userStats['doctors']}'),
              _MiniStat(label: 'Nurses', value: '${_userStats['nurses']}'),
              _MiniStat(label: 'Patients', value: '${_userStats['patients']}'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text('Doctor & Patient Activity', style: AppTextStyles.h4),
        const SizedBox(height: 10),
        if (medicalActivity.isEmpty) const Text('No recent medical activity'),
        ...medicalActivity.map((item) => _ActivityListTile(item: item)),
      ],
    );
  }

  Widget _buildLogisticsTab() {
    final logisticsActivity =
        _recentActivity.where((a) => a.type == ActivityType.order).toList();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        GlassContainer(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _MiniStat(label: 'Pharmacy', value: '${_userStats['pharmacy']}'),
              const _MiniStat(
                  label: 'Drivers',
                  value: '4'), // Mock for now or add to UserRole
              _MiniStat(label: 'Orders', value: '${logisticsActivity.length}'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text('Delivery & Pharmacy Events', style: AppTextStyles.h4),
        const SizedBox(height: 10),
        if (logisticsActivity.isEmpty) const Text('No recent orders'),
        ...logisticsActivity.map((item) => _ActivityListTile(item: item)),
      ],
    );
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        _StatsCard(
          title: 'Total Users',
          value: '${_userStats['total']}',
          icon: Icons.people,
          color: AppColors.primary,
          trend: 'Live',
        ),
        _StatsCard(
          title: 'Activity Events',
          value: '${_recentActivity.length}',
          icon: Icons.notifications_active,
          color: Colors.orange,
          trend: 'Today',
        ),
      ],
    );
  }

  Widget _buildFullUserList() {
    return Scaffold(
      appBar: AppBar(title: const Text('All Mobile App Users')),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return ListTile(
            leading: CircleAvatar(child: Text(user.name[0])),
            title: Text(user.name),
            subtitle: Text(user.roleDisplayName),
            trailing: const Icon(Icons.chevron_right),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Monitor'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Users'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class _ActivityListTile extends StatelessWidget {
  final AdminActivityItem item;
  const _ActivityListTile({required this.item});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color color;
    switch (item.type) {
      case ActivityType.registration:
        icon = Icons.person_add;
        color = Colors.blue;
        break;
      case ActivityType.appointment:
        icon = Icons.calendar_month;
        color = Colors.purple;
        break;
      case ActivityType.order:
        icon = Icons.local_shipping;
        color = Colors.green;
        break;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.borderLight),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.1),
          child: Icon(icon, color: color, size: 20),
        ),
        title: Text(item.title,
            style:
                AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold)),
        subtitle: Text(item.description, style: AppTextStyles.caption),
        trailing: Text(
          '${item.timestamp.hour}:${item.timestamp.minute.toString().padLeft(2, '0')}',
          style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
        ),
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label;
  final String value;
  const _MiniStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: AppTextStyles.h4.copyWith(color: AppColors.primary)),
        Text(label, style: AppTextStyles.caption),
      ],
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
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: color),
              Text(trend,
                  style: const TextStyle(color: Colors.green, fontSize: 12)),
            ],
          ),
          const Spacer(),
          Text(value, style: AppTextStyles.h3),
          Text(title, style: AppTextStyles.caption),
        ],
      ),
    );
  }
}
