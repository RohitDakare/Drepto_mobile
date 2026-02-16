import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../models/appointment.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  final VoidCallback? onJoinTap;

  const AppointmentCard({
    super.key,
    required this.appointment,
    this.onJoinTap,
  });

  @override
  Widget build(BuildContext context) {
    final isUpcoming = appointment.status == AppointmentStatus.upcoming;
    final isVideo = appointment.type == AppointmentType.online;

    // Format date and time
    final dateStr = DateFormat('MMM d, yyyy').format(appointment.dateTime);
    final timeStr = DateFormat('h:mm a').format(appointment.dateTime);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppSpacing.borderRadiusMd,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: AppSpacing.borderRadiusSm,
                  color: AppColors.gray100,
                  // Placeholder for image logic since model lacks imageUrl currently
                  // In real app, we would load from appointment.doctorImageUrl or similar
                ),
                child: const Icon(Icons.person, color: AppColors.gray400),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment.doctorName,
                      style: AppTextStyles.labelLarge
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      appointment.specialty,
                      style: AppTextStyles.bodyMedium
                          .copyWith(color: AppColors.textSecondary),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: isUpcoming
                            ? AppColors.primary.withValues(alpha: 0.1)
                            : AppColors.gray100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        _getStatusText(appointment.status),
                        style: AppTextStyles.labelSmall.copyWith(
                          color: isUpcoming
                              ? AppColors.primary
                              : AppColors.gray500,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1),
          const SizedBox(height: 16),
          Row(
            children: [
              _InfoItem(icon: Icons.calendar_today, text: dateStr),
              const SizedBox(width: 24),
              _InfoItem(icon: Icons.access_time, text: timeStr),
              const SizedBox(width: 24),
              _InfoItem(
                icon: isVideo ? Icons.videocam : Icons.local_hospital,
                text: isVideo ? 'Video' : 'Visit',
              ),
            ],
          ),
          if (isUpcoming && isVideo) ...[
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onJoinTap ?? () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: AppSpacing.borderRadiusSm),
                ),
                child: const Text('Join Call'),
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _getStatusText(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.upcoming:
        return 'Upcoming';
      case AppointmentStatus.completed:
        return 'Completed';
      case AppointmentStatus.cancelled:
        return 'Cancelled';
    }
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.gray400),
        const SizedBox(width: 6),
        Text(
          text,
          style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
