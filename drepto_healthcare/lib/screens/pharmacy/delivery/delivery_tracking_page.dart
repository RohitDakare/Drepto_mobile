import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';

class DeliveryTrackingPage extends StatefulWidget {
  const DeliveryTrackingPage({super.key});

  @override
  State<DeliveryTrackingPage> createState() => _DeliveryTrackingPageState();
}

class _DeliveryTrackingPageState extends State<DeliveryTrackingPage> {
  final int _currentStep =
      2; // 0: Confirmed, 1: Packed, 2: Out for Delivery, 3: Delivered

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
          'Track Delivery',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Map Placeholder
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: AppColors.gray100,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.map,
                            size: 80, color: AppColors.gray300),
                        const SizedBox(height: 16),
                        Text(
                          'Live Tracking Map',
                          style: AppTextStyles.h4
                              .copyWith(color: AppColors.gray400),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: const Icon(Icons.my_location,
                        color: AppColors.textPrimary),
                    onPressed: () {},
                  ),
                ),
                // Delivery Agent Card Overlay
                const Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  child: _DriverInfoCard(),
                ),
              ],
            ),
          ),

          // Tracking Status
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0D000000),
                    blurRadius: 10,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Estimated Delivery',
                                style: AppTextStyles.caption),
                            Text('15 Mins', style: AppTextStyles.h3),
                          ],
                        ),
                        const _TimeStatusBadge(),
                      ],
                    ),
                    const SizedBox(height: 32),
                    _TrackingStep(
                      title: 'Order Placed',
                      time: '10:30 AM',
                      isActive: true,
                      isCompleted: _currentStep > 0,
                      isLast: false,
                    ),
                    _TrackingStep(
                      title: 'Packed',
                      time: '11:00 AM',
                      isActive: _currentStep >= 1,
                      isCompleted: _currentStep > 1,
                      isLast: false,
                    ),
                    _TrackingStep(
                      title: 'Out for Delivery',
                      time: '11:45 AM',
                      isActive: _currentStep >= 2,
                      isCompleted: _currentStep > 2,
                      isLast: false,
                    ),
                    _TrackingStep(
                      title: 'Delivered',
                      time: '---',
                      isActive: _currentStep >= 3,
                      isCompleted: _currentStep > 3,
                      isLast: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrackingStep extends StatelessWidget {
  final String title;
  final String time;
  final bool isActive;
  final bool isCompleted;
  final bool isLast;

  const _TrackingStep({
    required this.title,
    required this.time,
    required this.isActive,
    required this.isCompleted,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: isCompleted
                    ? AppColors.success
                    : (isActive ? AppColors.primary : AppColors.gray200),
                shape: BoxShape.circle,
                border: isActive && !isCompleted
                    ? Border.all(
                        color: AppColors.primary.withValues(alpha: 0.3),
                        width: 4)
                    : null,
              ),
              child: isCompleted
                  ? const Icon(Icons.check, size: 10, color: Colors.white)
                  : null,
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: isCompleted ? AppColors.success : AppColors.gray200,
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.labelLarge.copyWith(
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  color: isActive
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                ),
              ),
              Text(
                time,
                style:
                    AppTextStyles.caption.copyWith(color: AppColors.textMuted),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}

class _TimeStatusBadge extends StatelessWidget {
  const _TimeStatusBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: AppSpacing.borderRadiusFull,
      ),
      child: Text(
        'On Time',
        style: AppTextStyles.labelSmall
            .copyWith(color: AppColors.primary, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _DriverInfoCard extends StatelessWidget {
  const _DriverInfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppSpacing.borderRadiusMd,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            child: const Icon(Icons.person, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Mike Ross',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Text('Delivery Agent', style: AppTextStyles.caption),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.phone, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
