import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState extends StateNotifier<bool> {
  AppState() : super(false); // Initial state: drawer closed

  void openDrawer() {
    state = true;
  }

  void closeDrawer() {
    state = false;
  }
}

final appStateProvider = StateNotifierProvider<AppState, bool>((ref) => AppState());
