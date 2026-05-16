import 'package:flutter/material.dart';

import '../components/app_screen.dart';
import '../components/placeholder_state.dart';
import '../navigation/app_router.dart';
import '../theme/app_spacing.dart';

class ProductResultScreen extends StatelessWidget {
  const ProductResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product')),
      body: AppScreen(
        child: Column(
          children: [
            const PlaceholderState(
              title: 'Product result',
              body: 'This screen will show product details, ingredients, transparent warnings, and skin-profile notes.',
            ),
            const SizedBox(height: AppSpacing.md),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoute.ingredientDetail),
              child: const Text('Open Ingredient Detail'),
            ),
          ],
        ),
      ),
    );
  }
}
