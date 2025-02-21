import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFFFCAD2);
  static const Color secondaryColor = Color(0xFF62CDFA);
  static const Color textGray = Color(0xFF766565);
  static const Color tertiaryColor = Color(0xFFFFDF86);
  // static const Color 

  static ThemeData get theme {
    return ThemeData(
      primaryColor: primaryColor,
      cardColor: tertiaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: primaryColor,
        secondary: secondaryColor,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: textGray), 
        bodyMedium: TextStyle(color: textGray),
        bodySmall: TextStyle(color: textGray),
      ),
    );
  }
}
