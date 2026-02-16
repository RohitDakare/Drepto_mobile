import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_text_styles.dart';
import '../../widgets/buttons/app_buttons.dart';
import 'checkout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // TODO: Fetch real cart items from backend
  final List<CartItem> _items = [];

  double get _subtotal =>
      _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  double get _deliveryFee => 0.0;
  double get _taxes => _subtotal * 0.065;
  double get _total => _subtotal + _deliveryFee + _taxes;

  void _updateQuantity(int index, int change) {
    setState(() {
      _items[index].quantity += change;
      if (_items[index].quantity < 1) {
        _items.removeAt(index);
      }
    });
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
          'My Shopping Cart',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: _items.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.shopping_cart_outlined,
                          size: 64,
                          color: AppColors.gray400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Your cart is empty',
                          style: AppTextStyles.h5
                              .copyWith(color: AppColors.gray500),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Add items to start shopping',
                          style: AppTextStyles.bodyMedium
                              .copyWith(color: AppColors.gray400),
                        ),
                        const SizedBox(height: 24),
                        PrimaryButton(
                          text: 'Browse Store',
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Cart Items
                        ..._items.asMap().entries.map((entry) {
                          final index = entry.key;
                          final item = entry.value;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _CartItemCard(
                              item: item,
                              onIncrement: () => _updateQuantity(index, 1),
                              onDecrement: () => _updateQuantity(index, -1),
                            ),
                          );
                        }).toList(),

                        const SizedBox(height: 16),

                        // Coupon Section
                        Text(
                          'Have a coupon?',
                          style: AppTextStyles.labelMedium.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 48,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceLight,
                                  borderRadius: AppSpacing.borderRadiusMd,
                                  border:
                                      Border.all(color: AppColors.borderLight),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.confirmation_number_outlined,
                                      color: AppColors.gray400,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Enter promo code',
                                          hintStyle: AppTextStyles.bodyMedium
                                              .copyWith(
                                                  color: AppColors.textMuted),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              height: 48,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.primary),
                                borderRadius: AppSpacing.borderRadiusMd,
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Apply',
                                  style: AppTextStyles.buttonMedium.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Price Details
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.gray50,
                            borderRadius: AppSpacing.borderRadiusMd,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Price Details',
                                style: AppTextStyles.labelLarge.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 16),
                              _PriceRow(
                                label: 'Subtotal',
                                value: '\$${_subtotal.toStringAsFixed(2)}',
                              ),
                              const SizedBox(height: 8),
                              const _PriceRow(
                                label: 'Delivery Fee',
                                value: 'Free',
                                valueColor: AppColors.accent,
                              ),
                              const SizedBox(height: 8),
                              _PriceRow(
                                label: 'Taxes & Charges',
                                value: '\$${_taxes.toStringAsFixed(2)}',
                              ),
                              const Divider(height: 24),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Amount',
                                    style: AppTextStyles.labelLarge.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    '\$${_total.toStringAsFixed(2)}',
                                    style: AppTextStyles.h4.copyWith(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Security badge
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.verified_user_outlined,
                              color: AppColors.gray400,
                              size: 14,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'SECURE CHECKOUT GUARANTEED',
                              style: AppTextStyles.overline.copyWith(
                                color: AppColors.gray400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),

          // Checkout Button
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: PrimaryButton(
                text: 'Proceed to Checkout',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CheckoutPage()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartItemCard extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const _CartItemCard({
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: AppSpacing.borderRadiusMd,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.gray100,
              borderRadius: AppSpacing.borderRadiusSm,
            ),
            child: const Icon(
              Icons.medication,
              color: AppColors.gray400,
              size: 28,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        style: AppTextStyles.labelMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        color: AppColors.gray400,
                        size: 20,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: onDecrement,
                    ),
                  ],
                ),
                Text(item.description, style: AppTextStyles.caption),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${item.price.toStringAsFixed(2)}',
                      style: AppTextStyles.labelLarge.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderLight),
                        borderRadius: AppSpacing.borderRadiusSm,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: onDecrement,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: const Icon(
                                Icons.remove,
                                size: 16,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: Text(
                              '${item.quantity}',
                              style: AppTextStyles.labelMedium,
                            ),
                          ),
                          InkWell(
                            onTap: onIncrement,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: const Icon(
                                Icons.add,
                                size: 16,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _PriceRow({required this.label, required this.value, this.valueColor});

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
          style: AppTextStyles.labelMedium.copyWith(
            color: valueColor ?? AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class CartItem {
  final String name;
  final String description;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.description,
    required this.price,
    this.quantity = 1,
  });
}
