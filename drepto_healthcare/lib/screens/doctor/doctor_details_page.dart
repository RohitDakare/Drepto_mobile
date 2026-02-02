import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../models/doctor.dart';

class DoctorDetailsPage extends StatefulWidget {
  final Doctor doctor;

  const DoctorDetailsPage({
    super.key,
    required this.doctor,
  });

  @override
  State<DoctorDetailsPage> createState() => _DoctorDetailsPageState();
}

class _DoctorDetailsPageState extends State<DoctorDetailsPage> {
  int _selectedDateIndex = 0;
  int _selectedTimeIndex = -1;

  final List<String> _dates = ['Today, 27 Jan', 'Tomorrow, 28 Jan', 'Wed, 29 Jan'];
  late List<String> _timeSlots;

  @override
  void initState() {
    super.initState();
    _timeSlots = widget.doctor.availableSlots;
  }

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
                  Text(widget.doctor.name, style: AppTextStyles.h3),
                  const SizedBox(height: 8),
                  Text(
                    widget.doctor.specialty,
                    style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.doctor.hospital,
                    style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.doctor.rating} (${widget.doctor.reviews}+ Reviews)',
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
              widget.doctor.about,
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, height: 1.5),
            ),
            const SizedBox(height: 32),

            // Schedules
            const Text('Schedules', style: AppTextStyles.h4),
            const SizedBox(height: 16),
            SizedBox(
              height: 350,
              child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 30)),
                onDateChanged: (date) {
                   setState(() {
                      // Logic to update selected date index or value
                      // For now just updating the UI state to show interaction
                      _selectedDateIndex = date.day;
                   });
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

            // Actions - Video Consultation
            PrimaryButton(
              text: 'Video Consultation (\$${widget.doctor.videoConsultationFee})',
              onPressed: () {
                context.pushNamed(
                  'video_call',
                  extra: {
                    'doctorName': widget.doctor.name,
                    'specialty': widget.doctor.specialty,
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            
            // Actions - Clinic Visit
            SecondaryButton(
              text: 'Book Clinic Visit (\$${widget.doctor.clinicVisitFee})',
               onPressed: () {
                // Determine if slot selected
                if (_selectedTimeIndex == -1) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select a time slot')),
                  );
                  return;
                }
                 ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Clinic Visit with ${widget.doctor.name} Booked!')),
                  );
               },
            ),
          ],
        ),
      ),
    );
  }
}
