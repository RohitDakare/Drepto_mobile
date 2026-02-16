import 'package:flutter/material.dart';
import 'package:drepto_healthcare/core/constants/app_colors.dart';
import 'package:drepto_healthcare/core/constants/app_text_styles.dart';
import 'package:drepto_healthcare/widgets/buttons/app_buttons.dart';

class NurseProfilePage extends StatelessWidget {
  const NurseProfilePage({super.key});

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
              Text('My Profile', style: AppTextStyles.h2),
              const SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                      child: const Icon(Icons.person,
                          size: 50, color: AppColors.primary),
                    ),
                    const SizedBox(height: 16),
                    Text('Sarah Williams', style: AppTextStyles.h3),
                    Text('Senior Nurse • RN',
                        style: AppTextStyles.bodyMedium
                            .copyWith(color: AppColors.textSecondary)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'ID: RN-8832',
                        style: AppTextStyles.labelSmall
                            .copyWith(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              _ProfileMenuItem(
                  icon: Icons.assignment_ind,
                  title: 'Certifications',
                  onTap: () {}),
              _ProfileMenuItem(
                  icon: Icons.history, title: 'Shift History', onTap: () {}),
              _ProfileMenuItem(
                  icon: Icons.notifications,
                  title: 'Notifications',
                  onTap: () {}),
              _ProfileMenuItem(
                  icon: Icons.settings, title: 'App Settings', onTap: () {}),
              _ProfileMenuItem(
                  icon: Icons.help_outline, title: 'Support', onTap: () {}),
              const SizedBox(height: 32),
              PrimaryButton(
                text: 'Log Out',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileMenuItem(
      {required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textSecondary),
      title: Text(title,
          style:
              AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w500)),
      trailing:
          const Icon(Icons.chevron_right, size: 20, color: AppColors.gray400),
      onTap: onTap,
    );
  }
}

