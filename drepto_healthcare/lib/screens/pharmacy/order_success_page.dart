import 'package:flutter/material.dart';
import 'package:drepto_healthcare/core/constants/app_colors.dart';
import 'package:drepto_healthcare/core/constants/app_spacing.dart';
import 'package:drepto_healthcare/core/constants/app_text_styles.dart';
import 'package:drepto_healthcare/widgets/buttons/app_buttons.dart';
import '../patient/patient_dashboard.dart';
import 'delivery/delivery_tracking_page.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              // Success animation
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: AppColors.accent,
                  size: 80,
                ),
              ),
              const SizedBox(height: 32),

              // Success text
              Text(
                'Order Placed!',
                style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 12),
              Text(
                'Your order has been successfully placed.\nYou will receive a confirmation shortly.',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Order details card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surfaceLight,
                  borderRadius: AppSpacing.borderRadiusMd,
                  border: Border.all(color: AppColors.borderLight),
                ),
                child: Column(
                  children: [
                    const _OrderDetailRow(
                      label: 'Order ID',
                      value: '#ORD-2023-45678',
                    ),
                    const Divider(height: 24),
                    const _OrderDetailRow(
                      label: 'Expected Delivery',
                      value: 'Oct 15, 2023',
                    ),
                    const Divider(height: 24),
                    _OrderDetailRow(
                      label: 'Total Amount',
                      value: '\$124.50',
                      valueStyle: AppTextStyles.h5.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Track order button
              SecondaryButton(
                text: 'Track Order',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const DeliveryTrackingPage()),
                  );
                },
                icon: Icons.local_shipping_outlined,
              ),
              const SizedBox(height: 12),

              // Continue shopping button
              PrimaryButton(
                text: 'Continue Shopping',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const PatientDashboard()),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OrderDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? valueStyle;

  const _OrderDetailRow({
    required this.label,
    required this.value,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: valueStyle ??
              AppTextStyles.labelMedium.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

