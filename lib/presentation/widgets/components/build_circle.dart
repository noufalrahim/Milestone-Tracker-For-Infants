import 'package:flutter/material.dart';

class BuildCircle extends StatelessWidget {
  const BuildCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
    );
  }
}