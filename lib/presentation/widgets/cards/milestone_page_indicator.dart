import 'package:flutter/material.dart';

class MilestonePageIndicator extends StatelessWidget {
  final Color color;  // Dynamic color
  final String label; // Dynamic label
  final VoidCallback onPressed; // Callback for button press

  const MilestonePageIndicator({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 100.0, // Minimum width
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: onPressed, // Pass the callback
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
