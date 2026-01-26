import 'package:flutter/material.dart';

/// App color constants based on the Drepto Healthcare design system
class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF007E85);
  static const Color primaryLight = Color(0xFF1A9299);
  static const Color primaryDark = Color(0xFF005F64);

  // Accent Colors
  static const Color accent = Color(0xFF10B981);
  static const Color accentLight = Color(0xFF34D399);
  static const Color accentDark = Color(0xFF059669);

  // Background Colors
  static const Color backgroundLight = Color(0xFFF9FAFB);
  static const Color backgroundDark = Color(0xFF0F2223);

  // Surface Colors
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E3A3B);

  // Text Colors
  static const Color textPrimary = Color(0xFF101818);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textLight = Color(0xFFFFFFFF);
  static const Color textMuted = Color(0xFF9CA3AF);

  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Emergency/Alert Colors
  static const Color emergency = Color(0xFFDC2626);
  static const Color emergencyLight = Color(0xFFFEE2E2);
  static const Color emergencyBg = Color(0xFFFEF2F2);

  // Border Colors
  static const Color borderLight = Color(0xFFF3F4F6);
  static const Color borderDark = Color(0xFF374151);

  // Gray Scale
  static const Color gray50 = Color(0xFFF9FAFB);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color gray300 = Color(0xFFD1D5DB);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray600 = Color(0xFF4B5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1F2937);
  static const Color gray900 = Color(0xFF111827);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, accentLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Shadow Colors
  static Color shadowColor = Colors.black.withValues(alpha: 0.1);
  static Color shadowColorDark = Colors.black.withValues(alpha: 0.25);
}
