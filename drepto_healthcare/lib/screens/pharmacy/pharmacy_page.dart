import 'package:flutter/material.dart';
import 'package:drepto_healthcare/core/constants/app_colors.dart';
import 'package:drepto_healthcare/core/constants/app_spacing.dart';
import 'package:drepto_healthcare/core/constants/app_text_styles.dart';
import 'package:drepto_healthcare/widgets/inputs/app_inputs.dart';
import 'cart_page.dart';

class PharmacyPage extends StatefulWidget {
  const PharmacyPage({super.key});

  @override
  State<PharmacyPage> createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {
  final int _cartItemCount = 0;

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
          'Drepto Pharmacy',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.textPrimary,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartPage()),
                  );
                },
              ),
              if (_cartItemCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.error,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$_cartItemCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            AppSearchField(
              hint: 'Search for medicines, health products...',
              onChanged: (value) {},
            ),
            const SizedBox(height: 24),

            // Categories
            Text('Shop by Category', style: AppTextStyles.h4),
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _CategoryItem(
                    icon: Icons.medication,
                    label: 'Medicines',
                    color: AppColors.primary,
                  ),
                  SizedBox(width: 16),
                  _CategoryItem(
                    icon: Icons.favorite,
                    label: 'Cardiology',
                    color: AppColors.error,
                  ),
                  SizedBox(width: 16),
                  _CategoryItem(
                    icon: Icons.healing,
                    label: 'Pain Relief',
                    color: AppColors.warning,
                  ),
                  SizedBox(width: 16),
                  _CategoryItem(
                    icon: Icons.spa,
                    label: 'Wellness',
                    color: AppColors.accent,
                  ),
                  SizedBox(width: 16),
                  _CategoryItem(
                    icon: Icons.child_care,
                    label: 'Baby Care',
                    color: Colors.purple,
                  ),
                  SizedBox(width: 16),
                  _CategoryItem(
                    icon: Icons.clean_hands,
                    label: 'Personal Care',
                    color: Colors.teal,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Special Offers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Special Offers', style: AppTextStyles.h4),
                // _ViewAllButton(), // Hide until there is data
              ],
            ),
            const SizedBox(height: 16),
            // Placeholder for dynamic offers
            Container(
              height: 140,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.surfaceLight,
                borderRadius: AppSpacing.borderRadiusMd,
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Text(
                'No active offers',
                style: AppTextStyles.caption
                    .copyWith(color: AppColors.textSecondary),
              ),
            ),
            const SizedBox(height: 32),

            // Popular in Pain Relief
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular in Pain Relief', style: AppTextStyles.h4),
                IconButton(
                    icon: const Icon(Icons.arrow_forward), onPressed: () {}),
              ],
            ),
            const SizedBox(height: 12),
            // Placeholder for products
            Container(
              height: 100,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'No products available',
                style: AppTextStyles.caption
                    .copyWith(color: AppColors.textSecondary),
              ),
            ),
            const SizedBox(height: 24),

            // Vitamins & Supplements
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Vitamins & Supplements', style: AppTextStyles.h4),
                IconButton(
                    icon: const Icon(Icons.arrow_forward), onPressed: () {}),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              height: 100,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'No products available',
                style: AppTextStyles.caption
                    .copyWith(color: AppColors.textSecondary),
              ),
            ),
            const SizedBox(height: 24),

            // Antibiotics
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Antibiotics', style: AppTextStyles.h4),
                IconButton(
                    icon: const Icon(Icons.arrow_forward), onPressed: () {}),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              height: 100,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'No products available',
                style: AppTextStyles.caption
                    .copyWith(color: AppColors.textSecondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _CategoryItem({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

