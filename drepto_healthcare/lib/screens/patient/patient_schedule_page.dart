import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../models/appointment.dart';
import '../../widgets/cards/appointment_card.dart';

class PatientSchedulePage extends StatefulWidget {
  const PatientSchedulePage({super.key});

  @override
  State<PatientSchedulePage> createState() => _PatientSchedulePageState();
}

class _PatientSchedulePageState extends State<PatientSchedulePage> {
  // Use mock data from the model for now
  final List<Appointment> _appointments = Appointment.getMockAppointments(); 
  int _selectedTab = 0;
  final List<String> _tabs = ['Upcoming', 'Completed', 'Cancelled'];

  List<Appointment> get _filteredAppointments {
    final status = _tabs[_selectedTab].toLowerCase();
    return _appointments.where((apt) {
      if (status == 'upcoming') return apt.status == AppointmentStatus.upcoming;
      if (status == 'completed') return apt.status == AppointmentStatus.completed;
      if (status == 'cancelled') return apt.status == AppointmentStatus.cancelled;
      return true;
    }).toList();
  }

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
                itemCount: _filteredAppointments.length,
                itemBuilder: (context, index) {
                  return AppointmentCard(appointment: _filteredAppointments[index]);
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
