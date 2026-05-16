import 'package:flutter/material.dart';

import '../components/app_screen.dart';
import '../components/placeholder_state.dart';
import '../navigation/app_router.dart';
import '../theme/app_spacing.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        children: [
          const PlaceholderState(
            title: 'Search',
            body: 'Product search will connect to Supabase in a later phase.',
          ),
          const SizedBox(height: AppSpacing.md),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, AppRoute.productResult),
            child: const Text('Open Product Result'),
          ),
        ],
      ),
    );
  }
}
