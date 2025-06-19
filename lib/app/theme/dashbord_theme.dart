import 'package:flutter/material.dart';

class ModernDashboardTheme {
  // Colors
  static const Color primaryColor = Color(0xFF2979FF); // Deep blue
  static const Color secondaryColor = Color(0xFF00E5FF); // Cyan accent
  static const Color backgroundColor = Color(0xFF121212); // Dark theme
  static const Color surfaceColor = Color(0xFF1E1E1E);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB0BEC5); // Light gray
  static const Color borderColor = Color(0xFF37474F);

  // Padding
  static const EdgeInsets defaultPadding = EdgeInsets.symmetric(
    horizontal: 20.0,
    vertical: 12.0,
  );

  // Font
  static const String fontFamily = 'Poppins';

  // Text Styles
  static const TextStyle headlineStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: textSecondary,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  static const TextStyle cardTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: textPrimary,
  );

  static const TextStyle cardSubtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textSecondary,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
