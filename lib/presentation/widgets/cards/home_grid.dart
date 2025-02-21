import 'package:flutter/material.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/grid/grid.dart';

class HomeGrid extends StatelessWidget {
  BuildContext context;
  static const List<Map<String, dynamic>> gridData = [
    {
      'color': Color(0xFFB3E5FC),
      'icon': Icons.info,
      'title': 'When to act early'
    },
    {
      'color': Color(0xFFF8BBD0),
      'icon': Icons.star,
      'title': "My Child's Summary"
    },
    {
      'color': Color(0xFFAED581),
      'icon': Icons.abc,
      'title': 'Tips & Activities'
    },
    {
      'color': Color(0xFFD1C4E9),
      'icon': Icons.book,
      'title': 'Helpful Resources'
    },
    {
      'color': Color(0xFFFFCCBC),
      'icon': Icons.schedule,
      'title': 'Track Milestones'
    },
    {'color': Color(0xFF80DEEA), 'icon': Icons.help, 'title': 'Get Support'},
  ];
  HomeGrid({
    super.key,
  required this.context
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: ColoredGrid(
          gridData: gridData,
          crossAxisCount: 3,
        ),
      ),
    );
  }
}
