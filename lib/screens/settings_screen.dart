import 'package:flutter/material.dart';

import '../components/app_screen.dart';
import '../components/placeholder_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const AppScreen(
        child: PlaceholderState(
          title: 'Settings',
          body: 'Privacy, app preferences, and educational disclaimers will be configured here.',
        ),
      ),
    );
  }
}
