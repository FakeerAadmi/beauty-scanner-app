import 'package:flutter/material.dart';

import '../components/app_screen.dart';
import '../components/placeholder_state.dart';
import '../navigation/app_router.dart';
import '../theme/app_spacing.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        children: [
          const PlaceholderState(
            title: 'Profile',
            body: 'Skin type, concerns, sensitivities, and avoid-list settings will be collected here.',
          ),
          const SizedBox(height: AppSpacing.md),
          OutlinedButton(
            onPressed: () => Navigator.pushNamed(context, AppRoute.settings),
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }
}
