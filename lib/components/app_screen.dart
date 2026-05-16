import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: child,
      ),
    );
  }
}
