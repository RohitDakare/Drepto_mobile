import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';

class NurseAgendaPage extends StatelessWidget {
  const NurseAgendaPage({super.key});

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
                      Text('Weekly Agenda', style: AppTextStyles.h2),
                      Text('Oct 23 - Oct 29',
                          style: AppTextStyles.bodyMedium
                              .copyWith(color: AppColors.textSecondary)),
                    ],
                  ),
                  IconButton(
                    icon:
                        const Icon(Icons.date_range, color: AppColors.primary),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Calendar Strip (Simplified)
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 7,
                itemBuilder: (context, index) {
                  final days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                  final dates = ['23', '24', '25', '26', '27', '28', '29'];
                  final isSelected = index == 0;

                  return Container(
                    width: 60,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : Colors.white,
                      borderRadius: AppSpacing.borderRadiusMd,
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.borderLight,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          days[index],
                          style: AppTextStyles.caption.copyWith(
                            color: isSelected
                                ? Colors.white
                                : AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          dates[index],
                          style: AppTextStyles.h4.copyWith(
                            color: isSelected
                                ? Colors.white
                                : AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Visits List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text('Morning Shifts',
                      style: AppTextStyles.labelLarge
                          .copyWith(color: AppColors.textSecondary)),
                  const SizedBox(height: 12),
                  const _AgendaItem(
                    time: '08:00 AM',
                    title: 'Home Visit - Sarah J.',
                    subtitle: 'Post-op wound care',
                    status: 'Completed',
                    statusColor: AppColors.success,
                  ),
                  const _AgendaItem(
                    time: '10:30 AM',
                    title: 'IV Administration - Mike R.',
                    subtitle: 'Antibiotic course Day 3',
                    status: 'In Progress',
                    statusColor: AppColors.warning,
                  ),
                  const SizedBox(height: 24),
                  Text('Afternoon Shifts',
                      style: AppTextStyles.labelLarge
                          .copyWith(color: AppColors.textSecondary)),
                  const SizedBox(height: 12),
                  const _AgendaItem(
                    time: '02:00 PM',
                    title: 'Vitals Check - Emily D.',
                    subtitle: 'Weekly BP monitoring',
                    status: 'Pending',
                    statusColor: AppColors.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AgendaItem extends StatelessWidget {
  final String time;
  final String title;
  final String subtitle;
  final String status;
  final Color statusColor;

  const _AgendaItem({
    required this.time,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: AppTextStyles.labelMedium
                .copyWith(color: AppColors.textPrimary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: AppSpacing.borderRadiusMd,
                border: Border(
                  left: BorderSide(color: statusColor, width: 4),
                  top: const BorderSide(color: AppColors.borderLight),
                  right: const BorderSide(color: AppColors.borderLight),
                  bottom: const BorderSide(color: AppColors.borderLight),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,
                          style: AppTextStyles.labelLarge
                              .copyWith(fontWeight: FontWeight.w600)),
                      const Icon(Icons.more_horiz,
                          size: 20, color: AppColors.gray400),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(subtitle, style: AppTextStyles.caption),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      status,
                      style: AppTextStyles.labelSmall.copyWith(
                          color: statusColor, fontWeight: FontWeight.bold),
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
