import 'package:flutter/material.dart';
import 'theme_data.dart';

extension ThemeContextExtension on BuildContext {
  ThemeColors get colors {
    final themeColors = Theme.of(this).extension<ThemeColors>();
    assert(themeColors != null, 'ThemeColors extension not found in theme');
    return themeColors ?? ThemeColors.light;
  }
}
