import 'package:flutter/material.dart';

class HomeProfileCard extends StatelessWidget {
  const HomeProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Material(
            elevation: 5,
            shape: const CircleBorder(),
            child: CircleAvatar(
              radius: 75,
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.child_care_outlined,
                size: 100,
                color: Color.fromARGB(255, 213, 228, 255),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Noufal Rahim',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const Text(
          'is 2 months old!',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
