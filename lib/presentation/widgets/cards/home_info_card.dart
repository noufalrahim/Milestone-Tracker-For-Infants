import 'package:flutter/material.dart';

class HomeInfoCard extends StatelessWidget {
  const HomeInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 225, 136),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Center(
            child: Text(
              'The first checklist is for age 2 months. Click the menu button to take a look at the Milestone Overview for a peek ahead.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
