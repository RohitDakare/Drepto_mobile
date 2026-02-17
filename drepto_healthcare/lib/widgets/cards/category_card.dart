import 'package:flutter/material.dart';
import 'package:drepto_healthcare/models/lab_test_category.dart';
import 'package:drepto_healthcare/core/constants/app_spacing.dart';
import 'package:drepto_healthcare/core/constants/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Interactive category card with gradient background and animations
class CategoryCard extends StatefulWidget {
  final LabTestCategory category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        transform: Matrix4.diagonal3Values(
          _isPressed ? 0.95 : 1.0,
          _isPressed ? 0.95 : 1.0,
          1.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.isSelected
                  ? [
                      widget.category.primaryColor,
                      widget.category.primaryColor.withValues(alpha: 0.8),
                    ]
                  : [
                      widget.category.backgroundColor,
                      widget.category.backgroundColor,
                    ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: AppSpacing.borderRadiusMd,
            border: Border.all(
              color: widget.isSelected
                  ? widget.category.primaryColor
                  : widget.category.primaryColor.withValues(alpha: 0.2),
              width: widget.isSelected ? 2 : 1,
            ),
            boxShadow: widget.isSelected
                ? [
                    BoxShadow(
                      color:
                          widget.category.primaryColor.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon container
                Container(
                  width: 56.w,
                  height: 56.w,
                  decoration: BoxDecoration(
                    color: widget.isSelected
                        ? Colors.white.withValues(alpha: 0.2)
                        : widget.category.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Icon(
                    widget.category.icon,
                    size: 32.sp,
                    color: widget.isSelected
                        ? Colors.white
                        : widget.category.primaryColor,
                  ),
                ),
                SizedBox(height: 12.h),

                // Category name
                Text(
                  widget.category.name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.labelMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: widget.isSelected
                        ? Colors.white
                        : widget.category.primaryColor,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 4.h),

                // Test count
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: widget.isSelected
                        ? Colors.white.withValues(alpha: 0.2)
                        : widget.category.primaryColor.withValues(alpha: 0.1),
                    borderRadius: AppSpacing.borderRadiusFull,
                  ),
                  child: Text(
                    '${widget.category.testCount} tests',
                    style: AppTextStyles.caption.copyWith(
                      fontWeight: FontWeight.w500,
                      color: widget.isSelected
                          ? Colors.white
                          : widget.category.primaryColor,
                      fontSize: 11.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
        .animate(
          target: widget.isSelected ? 1 : 0,
        )
        .shimmer(
          duration: 1500.ms,
          color: Colors.white.withValues(alpha: 0.3),
        );
  }
}
