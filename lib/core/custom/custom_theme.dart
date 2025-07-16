import 'package:flutter/material.dart';
import '../theme/theme_data.dart';

import 'custom_font_weight.dart';

TextTheme customTextTheme(ThemeColors colors) {
  return TextTheme(
    displayLarge: TextStyle(
      letterSpacing: 0.0,
      color: colors.primaryText,
      fontSize: 57,
      fontWeight: CustomFontWeight.normal,
    ),
    displayMedium: TextStyle(
        letterSpacing: 0.0,
        color: colors.primaryText,
        fontSize: 45,
        fontWeight: CustomFontWeight.normal),
    displaySmall: TextStyle(
      letterSpacing: 0.0,
      color: colors.primaryText,
      fontSize: 24,
      fontWeight: CustomFontWeight.semiBold,
    ),
    headlineLarge: TextStyle(
        letterSpacing: 0.0,
        color: colors.primaryText,
        fontSize: 32,
        fontWeight: CustomFontWeight.normal),
    headlineMedium: TextStyle(
        letterSpacing: 0.0,
        color: colors.primaryText,
        fontSize: 22,
        fontWeight: CustomFontWeight.medium),
    headlineSmall: TextStyle(
        letterSpacing: 0.0,
        color: colors.primaryText,
        fontSize: 20,
        fontWeight: CustomFontWeight.bold),
    titleLarge: TextStyle(
        letterSpacing: 0.0,
        color: colors.primaryText,
        fontSize: 22,
        fontWeight: CustomFontWeight.medium),
    titleMedium: TextStyle(
        letterSpacing: 0.0,
        color: colors.secondaryText,
        fontSize: 18,
        fontWeight: CustomFontWeight.medium),
    titleSmall: TextStyle(
        letterSpacing: 0.0,
        color: colors.primaryText,
        fontSize: 16,
        fontWeight: CustomFontWeight.semiBold),
    labelLarge: TextStyle(
        letterSpacing: 0.0,
        color: colors.primaryText,
        fontSize: 14,
        fontWeight: CustomFontWeight.medium),
    labelMedium: TextStyle(
        letterSpacing: 0.0,
        color: colors.primaryText,
        fontSize: 12,
        fontWeight: CustomFontWeight.medium),
    labelSmall: TextStyle(
        letterSpacing: 0.0,
        color: colors.primaryText,
        fontSize: 11,
        fontWeight: CustomFontWeight.medium),
    bodyLarge: TextStyle(
      letterSpacing: 0.0,
      color: colors.primaryText,
      fontSize: 16,
      fontWeight: CustomFontWeight.normal,
    ),
    bodyMedium: TextStyle(
        letterSpacing: 0.0,
        color: colors.secondaryText,
        fontSize: 14,
        fontWeight: CustomFontWeight.medium),
    bodySmall: TextStyle(
        letterSpacing: 0.0,
        color: colors.primaryText,
        fontSize: 14,
        fontWeight: CustomFontWeight.medium),
  );
}
