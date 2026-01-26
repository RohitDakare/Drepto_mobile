import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';

class PatientSchedulePage extends StatefulWidget {
  const PatientSchedulePage({super.key});

  @override
  State<PatientSchedulePage> createState() => _PatientSchedulePageState();
}

class _PatientSchedulePageState extends State<PatientSchedulePage> {
  // Mock data for appointments
  final List<Appointment> _appointments = [
    Appointment(
      doctorName: 'Dr. Sarah Smith',
      specialty: 'Cardiologist',
      date: 'Today, Oct 24',
      time: '10:30 AM',
      type: 'Video Consultation',
      status: AppointmentStatus.upcoming,
      imageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
    ),
    Appointment(
      doctorName: 'Dr. Michael Chen',
      specialty: 'Dermatologist',
      date: 'Oct 26, 2023',
      time: '02:15 PM',
      type: 'Clinic Visit',
      status: AppointmentStatus.upcoming,
      imageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
    ),
    Appointment(
      doctorName: 'Dr. Emily Wilson',
      specialty: 'General Physician',
      date: 'Oct 10, 2023',
      time: '09:00 AM',
      type: 'Video Consultation',
      status: AppointmentStatus.completed,
      imageUrl: 'https://randomuser.me/api/portraits/women/68.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('My Schedule', style: AppTextStyles.h2),
                  IconButton(
                    icon: const Icon(Icons.calendar_month,
                        color: AppColors.primary),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // Tabs (Simplified for now)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _StatusTab(label: 'Upcoming', isActive: true),
                  SizedBox(width: 12),
                  _StatusTab(label: 'Completed', isActive: false),
                  SizedBox(width: 12),
                  _StatusTab(label: 'Canceled', isActive: false),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _appointments.length,
                itemBuilder: (context, index) {
                  return _AppointmentCard(appointment: _appointments[index]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class _StatusTab extends StatelessWidget {
  final String label;
  final bool isActive;

  const _StatusTab({required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : Colors.white,
        borderRadius: AppSpacing.borderRadiusFull,
        border: Border.all(
            color: isActive ? AppColors.primary : AppColors.borderLight),
      ),
      child: Text(
        label,
        style: AppTextStyles.labelMedium.copyWith(
          color: isActive ? Colors.white : AppColors.textSecondary,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  const _AppointmentCard({required this.appointment});

  @override
  Widget build(BuildContext context) {
    final isUpcoming = appointment.status == AppointmentStatus.upcoming;

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
                  image: DecorationImage(
                    image: NetworkImage(appointment.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
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
                        appointment.status == AppointmentStatus.upcoming
                            ? 'Upcoming'
                            : 'Completed',
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
              _InfoItem(icon: Icons.calendar_today, text: appointment.date),
              const SizedBox(width: 24),
              _InfoItem(icon: Icons.access_time, text: appointment.time),
              const SizedBox(width: 24),
              _InfoItem(
                icon: appointment.type == 'Video Consultation'
                    ? Icons.videocam
                    : Icons.local_hospital,
                text: appointment.type == 'Video Consultation'
                    ? 'Video'
                    : 'Visit',
              ),
            ],
          ),
          if (isUpcoming) ...[
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
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

enum AppointmentStatus { upcoming, completed, canceled }

class Appointment {
  final String doctorName;
  final String specialty;
  final String date;
  final String time;
  final String type;
  final AppointmentStatus status;
  final String imageUrl;

  Appointment({
    required this.doctorName,
    required this.specialty,
    required this.date,
    required this.time,
    required this.type,
    required this.status,
    required this.imageUrl,
  });
}
