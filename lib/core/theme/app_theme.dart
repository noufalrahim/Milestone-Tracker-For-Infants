import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFFFB6C1);

  static ThemeData get theme {
    return ThemeData(
      primaryColor: primaryColor,
      cardColor: primaryColor, // Background color for Card
    );
  }
}