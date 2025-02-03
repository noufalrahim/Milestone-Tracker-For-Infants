import 'package:flutter/material.dart';

class ColoredGrid extends StatelessWidget {
  final List<Map<String, dynamic>> gridData;
  final int crossAxisCount;

  const ColoredGrid({
    super.key,
    required this.gridData,
    this.crossAxisCount = 3, // Default to 3 columns
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount, // Number of cells in a row
        mainAxisSpacing: 10,
        crossAxisSpacing: 10, // Space between cells horizontally
      ),
      itemCount: gridData.length,
      itemBuilder: (context, index) {
        final cellData = gridData[index];
        return Container(
          decoration: BoxDecoration(
            color: cellData['color'], // Cell background color
            borderRadius: BorderRadius.circular(20), // Rounded corners
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center align items
              children: [
                Icon(
                  cellData['icon'], // Icon inside the cell
                  color: Colors.white, // Icon color
                  size: 36, // Icon size
                ),
                const SizedBox(height: 5),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      cellData['title'] ?? '', // Use a default empty string if 'title' is null
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12, // Adjust text size as needed
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center, // Center-align the text
                      overflow: TextOverflow.ellipsis, // Handle overflow gracefully
                      maxLines: 2, // Limit to 2 lines
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      shrinkWrap: true, // Grid adjusts to its content size
      physics: const NeverScrollableScrollPhysics(), // Disable inner scrolling
    );
  }
}
