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
  // TODO: Integrate with backend to fetch real appointments
  final List<Appointment> _appointments = []; 
  int _selectedTab = 0;
  final List<String> _tabs = ['Upcoming', 'Completed', 'Canceled'];

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
            // Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_tabs.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedTab = index),
                        child: _StatusTab(
                          label: _tabs[index], 
                          isActive: _selectedTab == index
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: _appointments.isEmpty 
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.event_busy, size: 64, color: AppColors.gray400),
                      const SizedBox(height: 16),
                      Text(
                        'No appointments yet',
                        style: AppTextStyles.h5.copyWith(color: AppColors.gray500),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Your upcoming appointments will appear here',
                        style: AppTextStyles.bodyMedium.copyWith(color: AppColors.gray400),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
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
                  // Use placeholder if image is failing or empty
                  color: AppColors.gray100, 
                  image: appointment.imageUrl.isNotEmpty 
                    ? DecorationImage(
                        image: NetworkImage(appointment.imageUrl),
                        fit: BoxFit.cover,
                        onError: (_, __) {}, 
                      )
                    : null,
                ),
                child: appointment.imageUrl.isEmpty 
                  ? const Icon(Icons.person, color: AppColors.gray400) 
                  : null, 
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
