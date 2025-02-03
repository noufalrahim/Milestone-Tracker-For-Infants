import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:milestone_tracker_for_infants/presentation/pages/calendar/calendar_page.dart';
import 'package:milestone_tracker_for_infants/presentation/pages/home/home_page.dart';
import 'package:milestone_tracker_for_infants/presentation/pages/milestones/milestones_page.dart';
import 'package:milestone_tracker_for_infants/presentation/pages/settings/settings_page.dart';
import 'package:milestone_tracker_for_infants/presentation/widgets/scaffold/BottomNavBar.dart';

class AppRouter {
  static GoRouter createRouter(Function(Locale) changeLocale) {
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => BottomNavScaffold(
            child: HomePage(changeLocale: changeLocale),
          ),
        ),
        GoRoute(
          path: '/milestones',
          name: 'milestones',
          builder: (context, state) => BottomNavScaffold(
            child: MilestonesPage(),
          ), 
        ),
        GoRoute(
          path: '/calendar',
          name: 'calendar',
          builder: (context, state) => BottomNavScaffold(
            child: CalendarPage()
          ),
        ),
        GoRoute(
          path: '/settings',
          name: 'settings',
          builder: (context, state) => BottomNavScaffold(
            child: SettingsPage(changeLocale: changeLocale),
          ),
        ),
      ],
    );
  }
}
