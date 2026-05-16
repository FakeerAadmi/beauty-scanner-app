import 'package:flutter/material.dart';

import '../components/app_screen.dart';
import '../components/placeholder_state.dart';

class IngredientDetailScreen extends StatelessWidget {
  const IngredientDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ingredient')),
      body: const AppScreen(
        child: PlaceholderState(
          title: 'Ingredient detail',
          body: 'Ingredient explanations, aliases, functions, evidence labels, and caution notes will live here.',
        ),
      ),
    );
  }
}
