import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:milestone_tracker_for_infants/presentation/providers/app_drawer_state.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/drawer/app_drawer.dart';

class BottomNavScaffold extends ConsumerStatefulWidget {
  final Widget child;

  const BottomNavScaffold({super.key, required this.child});

  @override
  _BottomNavScaffoldState createState() => _BottomNavScaffoldState();
}

class _BottomNavScaffoldState extends ConsumerState<BottomNavScaffold> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isDrawerOpen = ref.watch(appStateProvider);

    // Open or close the drawer based on state change
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isDrawerOpen) {
        _scaffoldKey.currentState?.openDrawer();
      } else {
        _scaffoldKey.currentState?.closeDrawer();
      }
    });

    return Scaffold(
      key: _scaffoldKey, // Assign the GlobalKey to Scaffold
      drawer: const AppDrawer(),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            label: 'Milestones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to corresponding routes
    switch (index) {
      case 0:
        ref.read(appStateProvider.notifier).closeDrawer();
        context.go('/');
        break;
      case 1:
        ref.read(appStateProvider.notifier).closeDrawer();
        context.go('/milestones');
        break;
      case 2:
        ref.read(appStateProvider.notifier).closeDrawer();
        context.go('/calendar');
        break;
      case 3:
        ref.read(appStateProvider.notifier).closeDrawer();
        context.go('/settings');
        break;
    }
  }
}
