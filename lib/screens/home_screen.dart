import 'package:flutter/material.dart';

import '../components/app_screen.dart';
import '../navigation/app_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skincare scanner',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.sage,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0,
                ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Understand a product before it reaches your shelf.',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.text,
                  fontWeight: FontWeight.w800,
                  height: 1.15,
                ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Scan a barcode, search products, or inspect ingredients with clear educational notes.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.mutedText,
                  height: 1.45,
                ),
          ),
          const SizedBox(height: AppSpacing.xl),
          ElevatedButton(
            onPressed: () => _showTabHint(context, 'Scan'),
            child: const Text('Scan Barcode'),
          ),
          const SizedBox(height: AppSpacing.md),
          OutlinedButton(
            onPressed: () => _showTabHint(context, 'Search'),
            child: const Text('Search Products'),
          ),
          const SizedBox(height: AppSpacing.md),
          OutlinedButton(
            onPressed: () => Navigator.pushNamed(context, AppRoute.productResult),
            child: const Text('View Sample Product'),
          ),
          const SizedBox(height: AppSpacing.md),
          OutlinedButton(
            onPressed: () => _showTabHint(context, 'Shelf'),
            child: const Text('My Shelf'),
          ),
        ],
      ),
    );
  }

  void _showTabHint(BuildContext context, String tabName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Open the $tabName tab from the bottom navigation.')),
    );
  }
}
