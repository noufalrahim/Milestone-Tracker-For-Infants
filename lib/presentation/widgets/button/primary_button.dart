import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double fontSize;
  final EdgeInsets padding;
  final double elevation;
  final Color shadowColor;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 12.0,
    this.fontSize = 16.0,
    this.padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    this.elevation = 4.0, // Default shadow elevation
    this.shadowColor = Colors.black38, // Default shadow color
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          padding: padding,
          textStyle: TextStyle(fontSize: fontSize),
          elevation: elevation, // Adding elevation for shadow
          shadowColor: shadowColor, // Custom shadow color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }
}
