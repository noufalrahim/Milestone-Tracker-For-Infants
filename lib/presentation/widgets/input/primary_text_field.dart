import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;

  const PrimaryTextField({
    super.key,
    required this.label,
    this.hintText = "Enter text",
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label, // Display label
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 5), // Small spacing
        Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade50, // Light blue inner shade
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: Colors.transparent, // Ensure container color is used
              border: InputBorder.none, // No border
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            ),
          ),
        ),
      ],
    );
  }
}
