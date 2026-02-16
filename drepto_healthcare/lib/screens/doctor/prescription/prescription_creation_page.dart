import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../widgets/buttons/app_buttons.dart';
import '../../../widgets/inputs/app_inputs.dart';

class PrescriptionCreationPage extends StatefulWidget {
  final String patientName;
  final String patientId;

  const PrescriptionCreationPage({
    super.key,
    required this.patientName,
    required this.patientId,
  });

  @override
  State<PrescriptionCreationPage> createState() =>
      _PrescriptionCreationPageState();
}

class _PrescriptionCreationPageState extends State<PrescriptionCreationPage> {
  final List<Map<String, String>> _medicines = [];
  final _drugController = TextEditingController();
  final _dosageController = TextEditingController();
  final _durationController = TextEditingController();

  void _addMedicine() {
    if (_drugController.text.isNotEmpty && _dosageController.text.isNotEmpty) {
      setState(() {
        _medicines.add({
          'drug': _drugController.text,
          'dosage': _dosageController.text,
          'duration': _durationController.text,
        });
        _drugController.clear();
        _dosageController.clear();
        _durationController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Write Prescription'),
        backgroundColor: AppColors.surfaceLight,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Show success message
            },
            child: Text('Save Draft',
                style: AppTextStyles.labelMedium
                    .copyWith(color: AppColors.primary)),
          ),
        ],
      ),
      body: Column(
        children: [
          // Patient Info Header
          Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.surfaceLight,
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: AppColors.gray200,
                  child: Icon(Icons.person, color: AppColors.gray600),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.patientName,
                        style: AppTextStyles.labelLarge
                            .copyWith(fontWeight: FontWeight.bold)),
                    Text('ID: ${widget.patientId}',
                        style: AppTextStyles.caption),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Diagnosis', style: AppTextStyles.h5),
                  const SizedBox(height: 8),
                  const AppTextField(
                    hint: 'Enter diagnosis...',
                    maxLines: 2,
                  ),
                  const SizedBox(height: 24),

                  Text('Medicines', style: AppTextStyles.h5),
                  const SizedBox(height: 12),

                  // Add Medicine Form
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: AppSpacing.borderRadiusMd,
                      border: Border.all(color: AppColors.borderLight),
                    ),
                    child: Column(
                      children: [
                        AppTextField(
                          label: 'Drug Name',
                          controller: _drugController,
                          hint: 'e.g. Amoxicillin',
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: AppTextField(
                                label: 'Dosage',
                                controller: _dosageController,
                                hint: 'e.g. 500mg',
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: AppTextField(
                                label: 'Duration',
                                controller: _durationController,
                                hint: 'e.g. 5 days',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SecondaryButton(
                          text: 'Add Medicine',
                          onPressed: _addMedicine,
                          icon: Icons.add,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Medicine List
                  if (_medicines.isNotEmpty) ...[
                    ..._medicines.asMap().entries.map((entry) {
                      final index = entry.key;
                      final med = entry.value;
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: AppSpacing.borderRadiusSm,
                          border: Border.all(color: AppColors.borderLight),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.medication,
                                  size: 16, color: AppColors.primary),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(med['drug']!,
                                      style: AppTextStyles.labelMedium.copyWith(
                                          fontWeight: FontWeight.w600)),
                                  Text('${med['dosage']} • ${med['duration']}',
                                      style: AppTextStyles.caption),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outline,
                                  size: 20, color: AppColors.error),
                              onPressed: () {
                                setState(() => _medicines.removeAt(index));
                              },
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],

                  const SizedBox(height: 24),
                  Text('Additional Notes', style: AppTextStyles.h5),
                  const SizedBox(height: 8),
                  const AppTextField(
                    hint: 'Advice, diet instructions, etc.',
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),

          // Bottom Bar
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: AppColors.borderLight)),
            ),
            child: PrimaryButton(
              text: 'Sign & Send Prescription',
              onPressed: () {
                // Submit logic
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

