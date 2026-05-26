import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Emerald
  static const Color primary = Color(0xFF047857);
  static const Color primaryLight = Color(0xFF10B981);
  static const Color primaryDark = Color(0xFF065F46);
  static const Color primarySurface = Color(0xFFD1FAE5);

  // Gold Accent
  static const Color gold = Color(0xFFD4AF37);
  static const Color goldLight = Color(0xFFF5E6B8);
  static const Color goldDark = Color(0xFFB8860B);

  // Light Theme
  static const Color lightBg = Color(0xFFF8FAF9);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF0FDF4);

  // Dark Theme
  static const Color darkBg = Color(0xFF0F1A15);
  static const Color darkCard = Color(0xFF1A2A23);
  static const Color darkSurface = Color(0xFF243530);
  static const Color darkElevated = Color(0xFF2D4038);

  // Text Colors
  static const Color textPrimary = Color(0xFF1F2937);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textLight = Color(0xFFF9FAFB);
  static const Color textMuted = Color(0xFF9CA3AF);

  // Status
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF10B981), Color(0xFF047857)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient headerGradient = LinearGradient(
    colors: [Color(0xFF047857), Color(0xFF065F46), Color(0xFF064E3B)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient goldGradient = LinearGradient(
    colors: [Color(0xFFD4AF37), Color(0xFFF5E6B8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkCardGradient = LinearGradient(
    colors: [Color(0xFF1A2A23), Color(0xFF243530)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient splashGradient = LinearGradient(
    colors: [Color(0xFF065F46), Color(0xFF047857), Color(0xFF10B981)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
