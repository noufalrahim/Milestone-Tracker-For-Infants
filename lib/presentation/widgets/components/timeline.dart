import 'package:flutter/material.dart';
import 'package:timeline_list/timeline_list.dart';

class TimelineWidget extends StatelessWidget {
  const TimelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the list of colors to cycle through
    final List<Color> colors = [
      const Color(0xFFF8BBD0),
      const Color(0xFFAED581),
      const Color(0xFF80DEEA),
    ];

    return Container(
      child: Timeline.builder(
        context: context,
        markerCount: 10,
        properties: TimelineProperties(
          iconAlignment: MarkerIconAlignment.center,
          iconSize: 36,
          timelinePosition: TimelinePosition.center,
        ),
        markerBuilder: (context, index) {
          // Cycle through the colors based on the index
          Color markerColor = colors[index % colors.length];

          return Marker(
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: markerColor, // Set the background color
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'I started to walk!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            icon: Container(
              width: 36, // Ensure a larger width to accommodate text
              height: 36, // Match the width for a perfect circle
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: Center(
                child: Text(
                  '2\nFeb', // Add a line break for better fit
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10, // Smaller font to fit within the circle
                  ),
                ),
              ),
            ),
            position: index % 2 == 0 ? MarkerPosition.left : MarkerPosition.right,
          );
        },
      ),
    );
  }
}
