import 'package:flutter/material.dart';
import 'package:drepto_healthcare/models/lab_test_category.dart';
import 'package:drepto_healthcare/core/constants/app_colors.dart';
import 'package:drepto_healthcare/core/constants/app_spacing.dart';
import 'package:drepto_healthcare/core/constants/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Enhanced lab test card with category badge and expandable details
class LabTestCardEnhanced extends StatefulWidget {
  final LabTestItem test;
  final LabTestCategory category;
  final VoidCallback? onBookNow;
  final VoidCallback? onFavorite;
  final bool isFavorite;

  const LabTestCardEnhanced({
    super.key,
    required this.test,
    required this.category,
    this.onBookNow,
    this.onFavorite,
    this.isFavorite = false,
  });

  @override
  State<LabTestCardEnhanced> createState() => _LabTestCardEnhancedState();
}

class _LabTestCardEnhancedState extends State<LabTestCardEnhanced> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: AppSpacing.borderRadiusMd,
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with badges
                Row(
                  children: [
                    // Category badge
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: widget.category.backgroundColor,
                        borderRadius: AppSpacing.borderRadiusFull,
                        border: Border.all(
                          color: widget.category.primaryColor
                              .withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            widget.category.icon,
                            size: 12.sp,
                            color: widget.category.primaryColor,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            widget.category.name,
                            style: AppTextStyles.caption.copyWith(
                              color: widget.category.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),

                    // Top seller badge
                    if (widget.test.isTopSeller)
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: AppColors.warning.withValues(alpha: 0.1),
                          borderRadius: AppSpacing.borderRadiusFull,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star,
                                color: AppColors.warning, size: 12.sp),
                            SizedBox(width: 4.w),
                            Text(
                              'TOP SELLER',
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.warning,
                                fontWeight: FontWeight.w700,
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ),

                    // Favorite button
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: widget.onFavorite,
                      child: Icon(
                        widget.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: widget.isFavorite
                            ? AppColors.error
                            : AppColors.textSecondary,
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),

                // Test name
                Text(
                  widget.test.name,
                  style: AppTextStyles.labelLarge.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 4.h),

                // Description
                Text(
                  widget.test.description,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 12.h),

                // Info chips row 1
                Wrap(
                  spacing: 12.w,
                  runSpacing: 8.h,
                  children: [
                    _InfoChip(
                      icon: Icons.science,
                      label:
                          '${widget.test.parameters} Parameter${widget.test.parameters > 1 ? 's' : ''}',
                    ),
                    _InfoChip(
                      icon: Icons.water_drop,
                      label: widget.test.sampleType,
                    ),
                    _InfoChip(
                      icon: Icons.access_time,
                      label: widget.test.reportTime,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),

                // Info chips row 2
                if (widget.test.fastingRequired || !widget.test.fastingRequired)
                  _InfoChip(
                    icon: widget.test.fastingRequired
                        ? Icons.schedule
                        : Icons.check_circle_outline,
                    label: widget.test.fastingRequired
                        ? 'Fasting: ${widget.test.fastingDuration}'
                        : 'No Fasting Required',
                    color: widget.test.fastingRequired
                        ? AppColors.warning
                        : AppColors.accent,
                  ),

                // Expandable section
                if (widget.test.includes.isNotEmpty ||
                    widget.test.preparation != null)
                  Column(
                    children: [
                      SizedBox(height: 12.h),
                      GestureDetector(
                        onTap: () => setState(() => _isExpanded = !_isExpanded),
                        child: Row(
                          children: [
                            Text(
                              _isExpanded ? 'Hide Details' : 'View Details',
                              style: AppTextStyles.labelSmall.copyWith(
                                color: widget.category.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Icon(
                              _isExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              size: 16.sp,
                              color: widget.category.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                // Expanded details
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Container(
                    margin: EdgeInsets.only(top: 12.h),
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: widget.category.backgroundColor,
                      borderRadius: AppSpacing.borderRadiusSm,
                      border: Border.all(
                        color:
                            widget.category.primaryColor.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.test.includes.isNotEmpty) ...[
                          Text(
                            'Includes:',
                            style: AppTextStyles.labelSmall.copyWith(
                              fontWeight: FontWeight.w600,
                              color: widget.category.primaryColor,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          ...widget.test.includes.map((item) => Padding(
                                padding: EdgeInsets.only(bottom: 4.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      size: 14.sp,
                                      color: widget.category.primaryColor,
                                    ),
                                    SizedBox(width: 6.w),
                                    Expanded(
                                      child: Text(
                                        item,
                                        style: AppTextStyles.caption.copyWith(
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                        if (widget.test.preparation != null) ...[
                          if (widget.test.includes.isNotEmpty)
                            SizedBox(height: 8.h),
                          Text(
                            'Preparation:',
                            style: AppTextStyles.labelSmall.copyWith(
                              fontWeight: FontWeight.w600,
                              color: widget.category.primaryColor,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            widget.test.preparation!,
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  crossFadeState: _isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                ),
                SizedBox(height: 16.h),

                // Price and action
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$${widget.test.price.toStringAsFixed(2)}',
                              style: AppTextStyles.h4.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            if (widget.test.originalPrice != null) ...[
                              SizedBox(width: 8.w),
                              Text(
                                '\$${widget.test.originalPrice!.toStringAsFixed(2)}',
                                style: AppTextStyles.caption.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ],
                        ),
                        if (widget.test.discountPercentage > 0)
                          Text(
                            '${widget.test.discountPercentage.toStringAsFixed(0)}% OFF',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.accent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: widget.onBookNow,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.category.primaryColor,
                        foregroundColor: Colors.white,
                        minimumSize: Size(0, 44.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 12.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: AppSpacing.borderRadiusFull,
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Book Now',
                        style: AppTextStyles.labelMedium.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
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

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;

  const _InfoChip({
    required this.icon,
    required this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? AppColors.textSecondary;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14.sp, color: chipColor),
        SizedBox(width: 4.w),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: chipColor,
            fontSize: 11.sp,
          ),
        ),
      ],
    );
  }
}
