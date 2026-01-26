import 'package:flutter/material.dart';

/// App spacing constants for consistent layout throughout the app
class AppSpacing {
  AppSpacing._();

  // Base spacing values
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;
  static const double xxxxl = 40.0;

  // Screen padding
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: 16.0,
  );
  static const EdgeInsets screenPaddingSmall = EdgeInsets.symmetric(
    horizontal: 12.0,
  );
  static const EdgeInsets screenPaddingLarge = EdgeInsets.symmetric(
    horizontal: 24.0,
  );

  // Card padding
  static const EdgeInsets cardPadding = EdgeInsets.all(16.0);
  static const EdgeInsets cardPaddingSmall = EdgeInsets.all(12.0);
  static const EdgeInsets cardPaddingLarge = EdgeInsets.all(20.0);

  // Section spacing
  static const double sectionSpacing = 24.0;
  static const double sectionSpacingSmall = 16.0;
  static const double sectionSpacingLarge = 32.0;

  // Item spacing
  static const double itemSpacing = 12.0;
  static const double itemSpacingSmall = 8.0;
  static const double itemSpacingLarge = 16.0;

  // Border radius values
  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 20.0;
  static const double radiusXxl = 24.0;
  static const double radiusFull = 9999.0;

  // Border radius presets
  static const BorderRadius borderRadiusXs =
      BorderRadius.all(Radius.circular(radiusXs));
  static const BorderRadius borderRadiusSm =
      BorderRadius.all(Radius.circular(radiusSm));
  static const BorderRadius borderRadiusMd =
      BorderRadius.all(Radius.circular(radiusMd));
  static const BorderRadius borderRadiusLg =
      BorderRadius.all(Radius.circular(radiusLg));
  static const BorderRadius borderRadiusXl =
      BorderRadius.all(Radius.circular(radiusXl));
  static const BorderRadius borderRadiusXxl =
      BorderRadius.all(Radius.circular(radiusXxl));
  static const BorderRadius borderRadiusFull =
      BorderRadius.all(Radius.circular(radiusFull));

  // Icon sizes
  static const double iconSm = 16.0;
  static const double iconMd = 20.0;
  static const double iconLg = 24.0;
  static const double iconXl = 32.0;
  static const double iconXxl = 40.0;

  // Avatar sizes
  static const double avatarSm = 32.0;
  static const double avatarMd = 40.0;
  static const double avatarLg = 48.0;
  static const double avatarXl = 64.0;
  static const double avatarXxl = 80.0;

  // Button heights
  static const double buttonHeightSm = 36.0;
  static const double buttonHeightMd = 44.0;
  static const double buttonHeightLg = 52.0;
  static const double buttonHeightXl = 56.0;

  // Input field heights
  static const double inputHeightSm = 40.0;
  static const double inputHeightMd = 48.0;
  static const double inputHeightLg = 56.0;

  // Bottom navigation height
  static const double bottomNavHeight = 72.0;
  static const double bottomNavHeightIos = 84.0;

  // App bar height
  static const double appBarHeight = 56.0;
}
