import 'package:flutter/material.dart';

import '../components/app_screen.dart';
import '../components/placeholder_state.dart';
import '../navigation/app_router.dart';
import '../theme/app_spacing.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        children: [
          const PlaceholderState(
            title: 'Scan',
            body: 'Barcode scanning will be added after the app shell and data model are stable.',
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
