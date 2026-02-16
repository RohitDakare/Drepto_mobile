import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';

class PharmacyOrdersPage extends StatelessWidget {
  const PharmacyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Order Fulfillment'),
        backgroundColor: AppColors.surfaceLight,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              color: AppColors.surfaceLight,
              child: const TabBar(
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.textSecondary,
                indicatorColor: AppColors.primary,
                tabs: [
                  Tab(text: 'New Orders'),
                  Tab(text: 'Processing'),
                  Tab(text: 'Ready/Delivered'),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  _OrdersList(status: 'new'),
                  _OrdersList(status: 'processing'),
                  _OrdersList(status: 'completed'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrdersList extends StatelessWidget {
  final String status;

  const _OrdersList({required this.status});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) {
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
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order #${202300 + index}',
                    style: AppTextStyles.labelLarge
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getStatusColor(status).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      _getStatusLabel(status),
                      style: AppTextStyles.labelSmall.copyWith(
                        color: _getStatusColor(status),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 12,
                    backgroundColor: AppColors.gray200,
                    child:
                        Icon(Icons.person, size: 16, color: AppColors.gray600),
                  ),
                  const SizedBox(width: 8),
                  Text('Patient Name ${index + 1}',
                      style: AppTextStyles.bodyMedium),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Items: Paracetamol (x2), Vitamin C (x1), Cough Syrup (x1)',
                style: AppTextStyles.caption
                    .copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 16),
              const Divider(height: 1),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total: \$45.00', style: AppTextStyles.labelLarge),
                  if (status == 'new')
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 36),
                      ),
                      child: const Text('Accept Order'),
                    )
                  else if (status == 'processing')
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Mark Ready'),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'new':
        return AppColors.primary;
      case 'processing':
        return AppColors.warning;
      case 'completed':
        return AppColors.success;
      default:
        return AppColors.gray600;
    }
  }

  String _getStatusLabel(String status) {
    switch (status) {
      case 'new':
        return 'NEW';
      case 'processing':
        return 'PROCESSING';
      case 'completed':
        return 'COMPLETED';
      default:
        return status.toUpperCase();
    }
  }
}
