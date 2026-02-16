import 'package:flutter/material.dart';
import 'package:drepto_healthcare/core/constants/app_colors.dart';
import 'package:drepto_healthcare/core/constants/app_spacing.dart';
import 'package:drepto_healthcare/core/constants/app_text_styles.dart';

class DoctorSchedulePage extends StatelessWidget {
  const DoctorSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Schedule', style: AppTextStyles.h2),
                      Text('Monday, Oct 24',
                          style: AppTextStyles.bodyMedium
                              .copyWith(color: AppColors.textSecondary)),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today,
                        color: AppColors.primary),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Time slots
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 8,
                itemBuilder: (context, index) {
                  final hour = 9 + index;
                  final time =
                      '${hour > 12 ? hour - 12 : hour}:00 ${hour >= 12 ? 'PM' : 'AM'}';
                  final isBooked = index % 2 == 0;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 60,
                          child: Text(
                            time,
                            style: AppTextStyles.labelMedium.copyWith(
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Expanded(
                          child: isBooked
                              ? const _AppointmentCard(
                                  patientName: 'Jane Doe',
                                  reason: 'General Checkup',
                                  status: 'Confirmed',
                                  color: AppColors.primary,
                                )
                              : Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: AppSpacing.borderRadiusMd,
                                    border: Border.all(
                                        color: AppColors.gray200,
                                        style: BorderStyle.none),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Available Slot',
                                      style: AppTextStyles.caption
                                          .copyWith(color: AppColors.gray400),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  final String patientName;
  final String reason;
  final String status;
  final Color color;

  const _AppointmentCard({
    required this.patientName,
    required this.reason,
    required this.status,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        border: Border(left: BorderSide(color: color, width: 4)),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            patientName,
            style:
                AppTextStyles.labelLarge.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(reason, style: AppTextStyles.caption),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              status,
              style: AppTextStyles.labelSmall
                  .copyWith(color: color, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

