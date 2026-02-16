import 'package:flutter/material.dart';
import 'package:drepto_healthcare/core/constants/app_colors.dart';
import 'package:drepto_healthcare/core/constants/app_spacing.dart';
import 'package:drepto_healthcare/core/constants/app_text_styles.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceLight,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Clear All',
              style:
                  AppTextStyles.labelMedium.copyWith(color: AppColors.primary),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _NotificationItem(
            title: 'Appointment Confirmed',
            message:
                'Your appointment with Dr. Sarah Smith is confirmed for Oct 12, 10:30 AM.',
            time: '2 hours ago',
            isUnread: true,
            icon: Icons.event_available,
            iconColor: AppColors.success,
          ),
          _NotificationItem(
            title: 'Lab Report Ready',
            message: 'Your Lipid Profile report is now available for download.',
            time: 'Yesterday',
            isUnread: false,
            icon: Icons.science,
            iconColor: AppColors.primary,
          ),
          _NotificationItem(
            title: 'Medicine Reminder',
            message: 'It\'s time to take your Paracetamol.',
            time: 'Yesterday',
            isUnread: false,
            icon: Icons.medication,
            iconColor: AppColors.warning,
          ),
        ],
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final bool isUnread;
  final IconData icon;
  final Color iconColor;

  const _NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.isUnread,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isUnread ? AppColors.surfaceLight : Colors.transparent,
        borderRadius: AppSpacing.borderRadiusMd,
        border: isUnread ? Border.all(color: AppColors.borderLight) : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.labelLarge.copyWith(
                        fontWeight:
                            isUnread ? FontWeight.w700 : FontWeight.w600,
                      ),
                    ),
                    Text(
                      time,
                      style: AppTextStyles.caption,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


