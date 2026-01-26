import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../widgets/buttons/app_buttons.dart';
import 'ambulance_tracking_page.dart';

class RequestAmbulancePage extends StatefulWidget {
  const RequestAmbulancePage({super.key});

  @override
  State<RequestAmbulancePage> createState() => _RequestAmbulancePageState();
}

class _RequestAmbulancePageState extends State<RequestAmbulancePage> {
  int _selectedType = 0;

  final List<AmbulanceType> _types = [
    AmbulanceType(
      name: 'Basic Life Support (BLS)',
      description: 'For non-critical emergencies',
      eta: '4 mins away',
      price: 120.00,
      isFastest: true,
    ),
    AmbulanceType(
      name: 'Advanced Life Support (ALS)',
      description: 'Paramedic onboard',
      eta: '8 mins away',
      price: 250.00,
    ),
  ];

  void _confirmBooking() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AmbulanceTrackingPage()),
    );
  }

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
          'Request Ambulance',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Location inputs
          const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                _LocationInput(
                  icon: Icons.my_location,
                  iconColor: AppColors.primary,
                  label: 'Current Location: 5th Ave, NY',
                ),
                SizedBox(height: 12),
                _LocationInput(
                  icon: Icons.location_on,
                  iconColor: AppColors.error,
                  label: 'Set drop-off location',
                  isPlaceholder: true,
                ),
              ],
            ),
          ),

          // Map placeholder
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: AppColors.gray100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.map, size: 80, color: AppColors.gray300),
                      const SizedBox(height: 16),
                      Text(
                        'Map View',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                // Call button
                Positioned(
                  right: 16,
                  top: 16,
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.error,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.error.withValues(alpha: 0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.phone, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Ambulance type selection
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceLight,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Select Ambulance Type',
                        style: AppTextStyles.h5),
                    const SizedBox(height: 16),
                    ..._types.asMap().entries.map((entry) {
                      final index = entry.key;
                      final type = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _AmbulanceTypeCard(
                          type: type,
                          isSelected: _selectedType == index,
                          onTap: () => setState(() => _selectedType = index),
                        ),
                      );
                    }).toList(),
                    const Spacer(),
                    PrimaryButton(
                      text: 'Confirm Emergency Booking',
                      onPressed: _confirmBooking,
                      icon: Icons.emergency,
                    ),
                    const SizedBox(height: 12),
                    const Center(
                      child: Text(
                        'By confirming, you agree to emergency service dispatch terms.',
                        style: AppTextStyles.caption,
                        textAlign: TextAlign.center,
                      ),
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

class _LocationInput extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final bool isPlaceholder;

  const _LocationInput({
    required this.icon,
    required this.iconColor,
    required this.label,
    this.isPlaceholder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: AppSpacing.borderRadiusMd,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: AppTextStyles.bodyMedium.copyWith(
                color:
                    isPlaceholder ? AppColors.textMuted : AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AmbulanceTypeCard extends StatelessWidget {
  final AmbulanceType type;
  final bool isSelected;
  final VoidCallback onTap;

  const _AmbulanceTypeCard({
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceLight,
          borderRadius: AppSpacing.borderRadiusMd,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.borderLight,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            _CustomRadio(isSelected: isSelected),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        type.name,
                        style: AppTextStyles.labelMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (type.isFastest) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.accent.withValues(alpha: 0.1),
                            borderRadius: AppSpacing.borderRadiusFull,
                          ),
                          child: Text(
                            'FASTEST',
                            style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.accent,
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${type.eta} • ${type.description}',
                    style: AppTextStyles.caption,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${type.price.toStringAsFixed(2)}',
                    style: AppTextStyles.h5.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
            ),
            Container(
              width: 60,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColors.gray100,
                borderRadius: AppSpacing.borderRadiusSm,
              ),
              child: const Icon(Icons.local_shipping, color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomRadio extends StatelessWidget {
  final bool isSelected;
  const _CustomRadio({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.gray300,
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            )
          : null,
    );
  }
}

class AmbulanceType {
  final String name;
  final String description;
  final String eta;
  final double price;
  final bool isFastest;

  AmbulanceType({
    required this.name,
    required this.description,
    required this.eta,
    required this.price,
    this.isFastest = false,
  });
}
