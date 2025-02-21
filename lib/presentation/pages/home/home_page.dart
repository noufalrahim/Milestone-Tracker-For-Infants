import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:milestone_tracker_for_infants/presentation/providers/app_drawer_state.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/cards/home_grid.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/cards/home_info_card.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/cards/home_profile_card.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/cards/progress_card.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/drawer/app_drawer.dart';

class HomePage extends ConsumerWidget {
  final Function(Locale) changeLocale;

  const HomePage({super.key, required this.changeLocale});

  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static const List<Map<String, dynamic>> gridData = [
    {'color': Color(0xFFB3E5FC), 'icon': Icons.info, 'title': 'When to act early'},
    {'color': Color(0xFFF8BBD0), 'icon': Icons.star, 'title': "My Child's Summary"},
    {'color': Color(0xFFAED581), 'icon': Icons.abc, 'title': 'Tips & Activities'},
    {'color': Color(0xFFD1C4E9), 'icon': Icons.book, 'title': 'Helpful Resources'},
    {'color': Color(0xFFFFCCBC), 'icon': Icons.schedule, 'title': 'Track Milestones'},
    {'color': Color(0xFF80DEEA), 'icon': Icons.help, 'title': 'Get Support'},
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          onPressed: () => ref.read(appStateProvider.notifier).openDrawer(),
          icon: const Icon(Icons.menu),
        ),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeProfileCard(),
            HomeInfoCard(),
            const ProgressCard(),
            HomeGrid(context: context),
          ],
        ),
      ),
    );
  }
}
