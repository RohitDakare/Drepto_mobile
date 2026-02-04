import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../widgets/inputs/app_inputs.dart';

class LabTestsPage extends StatefulWidget {
  const LabTestsPage({super.key});

  @override
  State<LabTestsPage> createState() => _LabTestsPageState();
}

class _LabTestsPageState extends State<LabTestsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedCategory = 'All Tests';

  final List<String> _categories = [
    'All Tests',
    'Diabetes',
    'Heart',
    'Thyroid',
    'Full Body',
  ];

  final List<LabTest> _tests = [
    LabTest(
      name: 'HbA1c (Glycosylated Hemoglobin)',
      description: 'Known as Diabetes Control Test',
      parameters: 1,
      sampleType: 'Blood Sample',
      fastingRequired: false,
      reportTime: '12h',
      price: 19.00,
      originalPrice: 25.00,
      isTopSeller: true,
    ),
    LabTest(
      name: 'Lipid Profile',
      description: 'For heart health and cholesterol screening',
      parameters: 8,
      sampleType: 'Blood Sample',
      fastingRequired: true,
      reportTime: '24h',
      price: 29.00,
      originalPrice: 45.00,
    ),
    LabTest(
      name: 'Thyroid Profile (Total T3, T4, TSH)',
      description: 'Complete thyroid health check',
      parameters: 3,
      sampleType: 'Blood Sample',
      fastingRequired: false,
      reportTime: '24h',
      price: 35.00,
      originalPrice: 50.00,
    ),
    LabTest(
      name: 'Vitamin D Total',
      description: 'Check vitamin D levels',
      parameters: 1,
      sampleType: 'Blood Sample',
      fastingRequired: false,
      reportTime: '24h',
      price: 25.00,
      originalPrice: 35.00,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
          'Lab Tests & Diagnostics',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.textPrimary,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Location bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: AppColors.surfaceLight,
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: AppColors.primary,
                  size: 18,
                ),
                const SizedBox(width: 8),
                const Text('Delivering to ', style: AppTextStyles.caption),
                Text(
                  'Home - Upper West Side, NY',
                  style: AppTextStyles.labelSmall.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down, size: 18),
              ],
            ),
          ),

          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: AppSearchField(
              hint: 'Search for tests or packages...',
              onChanged: (value) {},
            ),
          ),

          // Tab bar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: AppColors.gray100,
              borderRadius: AppSpacing.borderRadiusFull,
            ),
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: AppColors.surfaceLight,
                borderRadius: AppSpacing.borderRadiusFull,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                  ),
                ],
              ),
              labelColor: AppColors.textPrimary,
              unselectedLabelColor: AppColors.textSecondary,
              labelStyle: AppTextStyles.labelMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
              tabs: const [
                Tab(text: 'Individual Tests'),
                Tab(text: 'Health Packages'),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Category chips
          SizedBox(
            height: 36,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = _selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedCategory = category),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.surfaceLight,
                        borderRadius: AppSpacing.borderRadiusFull,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.borderLight,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          category,
                          style: AppTextStyles.labelSmall.copyWith(
                            color: isSelected
                                ? Colors.white
                                : AppColors.textPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),

          // Home sample collection banner
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.05),
              borderRadius: AppSpacing.borderRadiusMd,
              border:
                  Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: AppSpacing.borderRadiusSm,
                  ),
                  child: const Icon(
                    Icons.home,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Home Sample Collection',
                        style: AppTextStyles.labelMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        'Free for orders above \$50. Certified phlebotomists.',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'LEARN MORE',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Test list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _tests.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _LabTestCard(test: _tests[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _LabTestCard extends StatelessWidget {
  final LabTest test;

  const _LabTestCard({required this.test});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: AppSpacing.borderRadiusMd,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (test.isTopSeller)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: 0.1),
                borderRadius: AppSpacing.borderRadiusFull,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: AppColors.warning, size: 12),
                  const SizedBox(width: 4),
                  Text(
                    'TOP SELLER',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.warning,
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          Text(
            test.name,
            style: AppTextStyles.labelLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(test.description, style: AppTextStyles.caption),
          const SizedBox(height: 12),
          Row(
            children: [
              _InfoChip(
                icon: Icons.science,
                label:
                    '${test.parameters} Parameter${test.parameters > 1 ? 's' : ''}',
              ),
              const SizedBox(width: 12),
              _InfoChip(icon: Icons.water_drop, label: test.sampleType),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              if (!test.fastingRequired)
                const _InfoChip(
                  icon: Icons.check_circle_outline,
                  label: 'No Fasting Required',
                  color: AppColors.accent,
                ),
              if (test.fastingRequired)
                const _InfoChip(
                  icon: Icons.schedule,
                  label: '10-12 hrs Fasting',
                  color: AppColors.warning,
                ),
              const SizedBox(width: 12),
              _InfoChip(
                icon: Icons.access_time,
                label: 'Reports in ${test.reportTime}',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '\$${test.price.toStringAsFixed(2)}',
                        style: AppTextStyles.h4.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      if (test.originalPrice != null) ...[
                        const SizedBox(width: 8),
                        Text(
                          '\$${test.originalPrice!.toStringAsFixed(2)}',
                          style: AppTextStyles.caption.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(0, 40),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: AppSpacing.borderRadiusFull,
                  ),
                ),
                child: const Text('Book Now'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;

  const _InfoChip({required this.icon, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? AppColors.textSecondary;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: chipColor),
        const SizedBox(width: 4),
        Text(label, style: AppTextStyles.caption.copyWith(color: chipColor)),
      ],
    );
  }
}

class LabTest {
  final String name;
  final String description;
  final int parameters;
  final String sampleType;
  final bool fastingRequired;
  final String reportTime;
  final double price;
  final double? originalPrice;
  final bool isTopSeller;

  LabTest({
    required this.name,
    required this.description,
    required this.parameters,
    required this.sampleType,
    required this.fastingRequired,
    required this.reportTime,
    required this.price,
    this.originalPrice,
    this.isTopSeller = false,
  });
}
