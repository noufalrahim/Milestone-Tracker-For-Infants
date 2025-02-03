import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  final Map<String, String> progressMapping = const {
    'social': '1/12',
    'language': '3/12',
    'cognitive': '7/12',
    'movement': '5/12',
    'when to act early': '2/12',
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Material(
        elevation: 5, // Set the elevation to create the raised effect
        borderRadius: BorderRadius.all(Radius.circular(10)), // Optional: rounding the corners
        color: Theme.of(context).primaryColor, // Background color
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: SingleChildScrollView(
            // Make the container scrollable
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Milestone Checklist'),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100))
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Generate the progress bar and text for each entry
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Column(
                      children: progressMapping.entries.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Progress bar
                              Container(
                                width: double.infinity,
                                height: 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.green.shade300,
                                ),
                              ),
                              SizedBox(height: 5), // Space between progress bar and text
                              // Progress Text
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(entry.key,
                                      style: TextStyle(color: Colors.black)),
                                  Text(
                                    entry.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
