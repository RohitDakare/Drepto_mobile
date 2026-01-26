import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../widgets/inputs/app_inputs.dart';

class HealthRecordsPage extends StatelessWidget {
  const HealthRecordsPage({super.key});

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
          'Health Records Vault',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            AppSearchField(
              hint: 'Search your records...',
              onChanged: (value) {},
            ),
            const SizedBox(height: 24),

            // Categories
            const Text('Categories', style: AppTextStyles.h5),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.2,
              children: [
                _CategoryCard(
                  title: 'Prescriptions',
                  icon: Icons.medication,
                  gradient: const [AppColors.primary, AppColors.primaryLight],
                  onTap: () {},
                ),
                _CategoryCard(
                  title: 'Lab Reports',
                  icon: Icons.science,
                  gradient: const [AppColors.accent, AppColors.accentLight],
                  onTap: () {},
                ),
                _CategoryCard(
                  title: 'Vaccinations',
                  icon: Icons.vaccines,
                  gradient: const [AppColors.info, Color(0xFF60A5FA)],
                  onTap: () {},
                ),
                _CategoryCard(
                  title: 'Medical History',
                  icon: Icons.history,
                  gradient: const [AppColors.warning, Color(0xFFFBBF24)],
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Recent Documents
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Recent Documents', style: AppTextStyles.h5),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Document list
            const _DocumentItem(
              title: 'Annual Blood Work',
              date: 'Oct 12, 2023',
              doctor: 'Dr. Sarah Jenkins',
              status: 'Verified',
              statusColor: AppColors.accent,
              icon: Icons.description,
            ),
            const SizedBox(height: 12),
            const _DocumentItem(
              title: 'Lisinopril Renewal',
              date: 'Sep 28, 2023',
              doctor: 'Dr. Michael Chen',
              icon: Icons.medication,
            ),
            const SizedBox(height: 12),
            const _DocumentItem(
              title: 'Covid-19 Booster',
              date: 'Aug 15, 2023',
              doctor: 'HealthHub Clinic',
              icon: Icons.vaccines,
            ),
            const SizedBox(height: 12),
            const _DocumentItem(
              title: 'Chest X-Ray Scan',
              date: 'Jul 20, 2023',
              doctor: 'Radiology Center',
              status: 'New',
              statusColor: AppColors.primary,
              icon: Icons.image,
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

class _CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Color> gradient;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.title,
    required this.icon,
    required this.gradient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: AppSpacing.borderRadiusMd,
          boxShadow: [
            BoxShadow(
              color: gradient.first.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(icon, color: Colors.white, size: 32),
              const Spacer(),
              Text(
                title,
                style: AppTextStyles.labelLarge.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DocumentItem extends StatelessWidget {
  final String title;
  final String date;
  final String doctor;
  final String? status;
  final Color? statusColor;
  final IconData icon;

  const _DocumentItem({
    required this.title,
    required this.date,
    required this.doctor,
    this.status,
    this.statusColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: AppSpacing.borderRadiusMd,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: AppSpacing.borderRadiusSm,
            ),
            child: Icon(icon, color: AppColors.primary, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: AppTextStyles.labelMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (status != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor?.withValues(alpha: 0.1) ??
                              AppColors.accent.withValues(alpha: 0.1),
                          borderRadius: AppSpacing.borderRadiusFull,
                        ),
                        child: Text(
                          status!,
                          style: AppTextStyles.labelSmall.copyWith(
                            color: statusColor ?? AppColors.accent,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text('$date • $doctor', style: AppTextStyles.caption),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.gray400),
        ],
      ),
    );
  }
}
