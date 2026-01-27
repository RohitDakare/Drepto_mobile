import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../widgets/buttons/app_buttons.dart';

class DoctorDetailsPage extends StatefulWidget {
  final String doctorName;
  final String specialty;
  final String about;
  final double rating;

  const DoctorDetailsPage({
    super.key,
    required this.doctorName,
    required this.specialty,
    this.about =
        'Experienced specialist with over 10 years of practice. Dedicated to providing comprehensive care and personalized treatment plans for all patients.',
    this.rating = 4.8,
  });

  @override
  State<DoctorDetailsPage> createState() => _DoctorDetailsPageState();
}

class _DoctorDetailsPageState extends State<DoctorDetailsPage> {
  int _selectedDateIndex = 0;
  int _selectedTimeIndex = -1;

  final List<String> _dates = ['Today, 27 Jan', 'Tomorrow, 28 Jan', 'Wed, 29 Jan'];
  final List<String> _timeSlots = [
    '09:00 AM',
    '10:00 AM',
    '11:30 AM',
    '02:00 PM',
    '04:30 PM',
    '06:00 PM'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
        title: const Text('Doctor Details', style: AppTextStyles.h4),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Header
            Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary.withValues(alpha: 0.1),
                       image: const DecorationImage(
                        image: AssetImage('assets/images/doctor_placeholder.png'), // Placeholder
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Icon(Icons.person, size: 60, color: AppColors.primary), // Fallback
                  ),
                  const SizedBox(height: 16),
                  Text(widget.doctorName, style: AppTextStyles.h3),
                  const SizedBox(height: 8),
                  Text(
                    widget.specialty,
                    style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.rating} (120+ Reviews)',
                        style: AppTextStyles.labelMedium.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // About
            const Text('About Doctor', style: AppTextStyles.h4),
            const SizedBox(height: 8),
            Text(
              widget.about,
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, height: 1.5),
            ),
            const SizedBox(height: 32),

            // Schedules
            const Text('Schedules', style: AppTextStyles.h4),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _dates.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final isSelected = _selectedDateIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedDateIndex = index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary : AppColors.surfaceLight,
                        borderRadius: AppSpacing.borderRadiusFull,
                        border: Border.all(
                          color: isSelected ? AppColors.primary : AppColors.borderLight,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          _dates[index],
                          style: AppTextStyles.labelMedium.copyWith(
                            color: isSelected ? Colors.white : AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text('Available Slots', style: AppTextStyles.labelLarge),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: List.generate(_timeSlots.length, (index) {
                final isSelected = _selectedTimeIndex == index;
                return GestureDetector(
                  onTap: () => setState(() => _selectedTimeIndex = index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : AppColors.surfaceLight,
                      borderRadius: AppSpacing.borderRadiusMd,
                      border: Border.all(
                        color: isSelected ? AppColors.primary : AppColors.borderLight,
                      ),
                    ),
                    child: Text(
                      _timeSlots[index],
                      style: AppTextStyles.labelMedium.copyWith(
                        color: isSelected ? AppColors.primary : AppColors.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 40),

            // Actions
            PrimaryButton(
              text: 'Video Consultation',
              onPressed: () {
                context.pushNamed(
                  'video_call',
                  extra: {
                    'doctorName': widget.doctorName,
                    'specialty': widget.specialty,
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            SecondaryButton(
              text: 'Book Clinic Visit',
               onPressed: () {
                // Determine if slot selected
                if (_selectedTimeIndex == -1) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select a time slot')),
                  );
                  return;
                }
                 ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Clinic Visit Booked!')),
                  );
               },
            ),
          ],
        ),
      ),
    );
  }
}
