import 'package:flutter/material.dart';

import '../components/app_screen.dart';
import '../components/placeholder_state.dart';

class SavedShelfScreen extends StatelessWidget {
  const SavedShelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScreen(
      child: PlaceholderState(
        title: 'Saved shelf',
        body: 'Saved products and favorites will appear here once authentication and Supabase storage are added.',
      ),
    );
  }
}
