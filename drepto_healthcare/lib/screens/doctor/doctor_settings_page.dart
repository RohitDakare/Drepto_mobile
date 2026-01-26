import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../widgets/buttons/app_buttons.dart';

class DoctorSettingsPage extends StatelessWidget {
  const DoctorSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Settings', style: AppTextStyles.h2),
              const SizedBox(height: 24),

              // Profile Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: AppSpacing.borderRadiusMd,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/men/75.jpg'),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Dr. Smith', style: AppTextStyles.h4),
                          Text('Cardiologist',
                              style: AppTextStyles.bodyMedium
                                  .copyWith(color: AppColors.textSecondary)),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit_outlined,
                          color: AppColors.primary),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              const Text('General', style: AppTextStyles.h5),
              const SizedBox(height: 8),
              _SettingsTile(
                  icon: Icons.person_outline,
                  title: 'Personal Information',
                  onTap: () {}),
              _SettingsTile(
                  icon: Icons.access_time,
                  title: 'Availability & Schedule',
                  onTap: () {}),
              _SettingsTile(
                  icon: Icons.notifications_outlined,
                  title: 'Notifications',
                  onTap: () {}),

              const SizedBox(height: 24),
              const Text('Practice', style: AppTextStyles.h5),
              const SizedBox(height: 8),
              _SettingsTile(
                  icon: Icons.medical_services_outlined,
                  title: 'Clinic Details',
                  onTap: () {}),
              _SettingsTile(
                  icon: Icons.payment,
                  title: 'Payments & Payouts',
                  onTap: () {}),
              _SettingsTile(
                  icon: Icons.history,
                  title: 'Consultation History',
                  onTap: () {}),

              const SizedBox(height: 24),
              const Text('Support', style: AppTextStyles.h5),
              const SizedBox(height: 8),
              _SettingsTile(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  onTap: () {}),
              _SettingsTile(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy Policy',
                  onTap: () {}),

              const SizedBox(height: 32),
              PrimaryButton(
                text: 'Log Out',
                onPressed: () {},
                // backgroundColor: AppColors.error.withValues(alpha: 0.1),
                // textColor: AppColors.error,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _SettingsTile(
      {required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppSpacing.borderRadiusSm,
        border: Border.all(color: AppColors.gray200),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title,
            style:
                AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios,
            size: 16, color: AppColors.gray400),
        onTap: onTap,
      ),
    );
  }
}
