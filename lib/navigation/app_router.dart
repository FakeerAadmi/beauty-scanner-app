import 'package:flutter/material.dart';

import '../screens/ingredient_detail_screen.dart';
import '../screens/main_shell.dart';
import '../screens/product_result_screen.dart';
import '../screens/settings_screen.dart';

class AppRoute {
  static const home = '/';
  static const productResult = '/product-result';
  static const ingredientDetail = '/ingredient-detail';
  static const settings = '/settings';
}

final Map<String, WidgetBuilder> appRoutes = {
  AppRoute.home: (_) => const MainShell(),
  AppRoute.productResult: (_) => const ProductResultScreen(),
  AppRoute.ingredientDetail: (_) => const IngredientDetailScreen(),
  AppRoute.settings: (_) => const SettingsScreen(),
};
