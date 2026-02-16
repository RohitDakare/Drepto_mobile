import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// App spacing constants for consistent layout throughout the app
class AppSpacing {
  AppSpacing._();

  // Base spacing values
  static double get xs => 4.0.w;
  static double get sm => 8.0.w;
  static double get md => 12.0.w;
  static double get lg => 16.0.w;
  static double get xl => 20.0.w;
  static double get xxl => 24.0.w;
  static double get xxxl => 32.0.w;
  static double get xxxxl => 40.0.w;

  // Screen padding
  static EdgeInsets get screenPadding => EdgeInsets.symmetric(
        horizontal: 16.0.w,
      );
  static EdgeInsets get screenPaddingSmall => EdgeInsets.symmetric(
        horizontal: 12.0.w,
      );
  static EdgeInsets get screenPaddingLarge => EdgeInsets.symmetric(
        horizontal: 24.0.w,
      );

  // Card padding
  static EdgeInsets get cardPadding => EdgeInsets.all(16.0.w);
  static EdgeInsets get cardPaddingSmall => EdgeInsets.all(12.0.w);
  static EdgeInsets get cardPaddingLarge => EdgeInsets.all(20.0.w);

  // Section spacing
  static double get sectionSpacing => 24.0.h;
  static double get sectionSpacingSmall => 16.0.h;
  static double get sectionSpacingLarge => 32.0.h;

  // Item spacing
  static double get itemSpacing => 12.0.h;
  static double get itemSpacingSmall => 8.0.h;
  static double get itemSpacingLarge => 16.0.h;

  // Border radius values
  static double get radiusXs => 4.0.r;
  static double get radiusSm => 8.0.r;
  static double get radiusMd => 12.0.r;
  static double get radiusLg => 16.0.r;
  static double get radiusXl => 20.0.r;
  static double get radiusXxl => 24.0.r;
  static double get radiusFull => 9999.0.r;

  // Border radius presets
  static BorderRadius get borderRadiusXs =>
      BorderRadius.all(Radius.circular(radiusXs));
  static BorderRadius get borderRadiusSm =>
      BorderRadius.all(Radius.circular(radiusSm));
  static BorderRadius get borderRadiusMd =>
      BorderRadius.all(Radius.circular(radiusMd));
  static BorderRadius get borderRadiusLg =>
      BorderRadius.all(Radius.circular(radiusLg));
  static BorderRadius get borderRadiusXl =>
      BorderRadius.all(Radius.circular(radiusXl));
  static BorderRadius get borderRadiusXxl =>
      BorderRadius.all(Radius.circular(radiusXxl));
  static BorderRadius get borderRadiusFull =>
      BorderRadius.all(Radius.circular(radiusFull));

  // Icon sizes
  static double get iconSm => 16.0.r;
  static double get iconMd => 20.0.r;
  static double get iconLg => 24.0.r;
  static double get iconXl => 32.0.r;
  static double get iconXxl => 40.0.r;

  // Avatar sizes
  static double get avatarSm => 32.0.r;
  static double get avatarMd => 40.0.r;
  static double get avatarLg => 48.0.r;
  static double get avatarXl => 64.0.r;
  static double get avatarXxl => 80.0.r;

  // Button heights
  static double get buttonHeightSm => 36.0.h;
  static double get buttonHeightMd => 44.0.h;
  static double get buttonHeightLg => 52.0.h;
  static double get buttonHeightXl => 56.0.h;

  // Input field heights
  static double get inputHeightSm => 40.0.h;
  static double get inputHeightMd => 48.0.h;
  static double get inputHeightLg => 56.0.h;

  // Bottom navigation height
  static double get bottomNavHeight => 72.0.h;
  static double get bottomNavHeightIos => 84.0.h;

  // App bar height
  static double get appBarHeight => 56.0.h;
}
