import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';

class PharmacyAdminDashboard extends StatelessWidget {
  const PharmacyAdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Pharmacy Admin'),
        backgroundColor: AppColors.surfaceLight,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _AdminCard(
            title: 'Inventory',
            icon: Icons.inventory,
            color: Colors.blue,
            onTap: () {
              // Navigation handled by router
              // context.pushNamed('pharmacy_inventory');
            },
          ),
          _AdminCard(
            title: 'Orders',
            icon: Icons.shopping_bag,
            color: Colors.orange,
            onTap: () {
              // Navigation handled by router
              // context.pushNamed('pharmacy_orders');
            },
          ),
          _AdminCard(
            title: 'Analytics',
            icon: Icons.bar_chart,
            color: Colors.purple,
            onTap: () {},
          ),
          _AdminCard(
            title: 'Staff',
            icon: Icons.people,
            color: Colors.green,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _AdminCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _AdminCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppSpacing.borderRadiusMd,
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: AppTextStyles.h4.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}


