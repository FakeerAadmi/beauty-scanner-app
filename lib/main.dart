import 'package:flutter/material.dart';

import 'navigation/app_router.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const BeautyScannerApp());
}

class BeautyScannerApp extends StatelessWidget {
  const BeautyScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beauty Scanner',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      initialRoute: AppRoute.home,
      routes: appRoutes,
    );
  }
}
