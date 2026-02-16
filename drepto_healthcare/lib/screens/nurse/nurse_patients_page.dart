import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../widgets/inputs/app_inputs.dart';

class NursePatientsPage extends StatelessWidget {
  const NursePatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Assigned Patients', style: AppTextStyles.h2),
                  const SizedBox(height: 16),
                  AppSearchField(
                    hint: 'Filter by name or location...',
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: 5,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return _AssignedPatientCard(
                    name: 'Patient Name ${index + 1}',
                    age: '${60 + index}',
                    condition: 'Post-Surgery Recovery',
                    location: '123 Medical Lane, Apt ${100 + index}',
                    nextVisit: 'Tomorrow, 09:00 AM',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AssignedPatientCard extends StatelessWidget {
  final String name;
  final String age;
  final String condition;
  final String location;
  final String nextVisit;

  const _AssignedPatientCard({
    required this.name,
    required this.age,
    required this.condition,
    required this.location,
    required this.nextVisit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppSpacing.borderRadiusMd,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.accent.withValues(alpha: 0.1),
                child: Text(
                  name.substring(0, 1),
                  style: AppTextStyles.h4.copyWith(color: AppColors.accent),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: AppTextStyles.labelLarge
                            .copyWith(fontWeight: FontWeight.w600)),
                    Text('$age Years • $condition',
                        style: AppTextStyles.caption),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.phone, color: AppColors.primary),
                onPressed: () {},
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            children: [
              const Icon(Icons.location_on, size: 16, color: AppColors.gray400),
              const SizedBox(width: 8),
              Expanded(
                child: Text(location, style: AppTextStyles.bodySmall),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.calendar_today,
                  size: 16, color: AppColors.gray400),
              const SizedBox(width: 8),
              Text('Next Visit: ',
                  style: AppTextStyles.bodySmall
                      .copyWith(color: AppColors.textSecondary)),
              Text(nextVisit,
                  style: AppTextStyles.bodySmall
                      .copyWith(fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('View Care Plan'),
            ),
          ),
        ],
      ),
    );
  }
}
