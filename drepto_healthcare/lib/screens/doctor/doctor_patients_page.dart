import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../widgets/inputs/app_inputs.dart';

class DoctorPatientsPage extends StatelessWidget {
  const DoctorPatientsPage({super.key});

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
                  const Text('Patients Directory', style: AppTextStyles.h2),
                  const SizedBox(height: 16),
                  AppSearchField(
                    hint: 'Search patients by name or ID...',
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: 10,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return _PatientListItem(
                    name: 'Patient Name ${index + 1}',
                    id: 'PID-${1000 + index}',
                    age: '${25 + index}',
                    gender: index % 2 == 0 ? 'Female' : 'Male',
                    lastVisit: 'Oct ${10 + index}, 2023',
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

class _PatientListItem extends StatelessWidget {
  final String name;
  final String id;
  final String age;
  final String gender;
  final String lastVisit;

  const _PatientListItem({
    required this.name,
    required this.id,
    required this.age,
    required this.gender,
    required this.lastVisit,
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
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                name.substring(0, 2).toUpperCase(),
                style: AppTextStyles.h4.copyWith(color: AppColors.primary),
              ),
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
                Text('ID: $id', style: AppTextStyles.caption),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('$age Yrs, $gender', style: AppTextStyles.bodySmall),
              const SizedBox(height: 4),
              Text('Last: $lastVisit',
                  style: AppTextStyles.caption
                      .copyWith(color: AppColors.textSecondary)),
            ],
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, color: AppColors.gray400),
        ],
      ),
    );
  }
}
