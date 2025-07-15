import 'package:flutter/material.dart';
import '../theme/theme_data.dart';

import 'custom_font_weight.dart';

TextTheme customTextTheme(ThemeColors colors) {
  return TextTheme(
    displayLarge: TextStyle(
      color: colors.primaryText,
      fontSize: 57,
      fontWeight: CustomFontWeight.normal,
    ),
    displayMedium: TextStyle(
        color: colors.primaryText,
        fontSize: 45,
        fontWeight: CustomFontWeight.normal),
    displaySmall: TextStyle(
      color: colors.primaryText,
      fontSize: 24,
      fontWeight: CustomFontWeight.semiBold,
    ),
    headlineLarge: TextStyle(
        color: colors.primaryText,
        fontSize: 32,
        fontWeight: CustomFontWeight.normal),
    headlineMedium: TextStyle(
        color: colors.primaryText,
        fontSize: 22,
        fontWeight: CustomFontWeight.medium),
    headlineSmall: TextStyle(
        color: colors.primaryText,
        fontSize: 20,
        fontWeight: CustomFontWeight.bold),
    titleLarge: TextStyle(
        color: colors.primaryText,
        fontSize: 22,
        fontWeight: CustomFontWeight.medium),
    titleMedium: TextStyle(
        color: colors.secondaryText,
        fontSize: 18,
        fontWeight: CustomFontWeight.medium),
    titleSmall: TextStyle(
        color: colors.primaryText,
        fontSize: 16,
        fontWeight: CustomFontWeight.semiBold),
    labelLarge: TextStyle(
        color: colors.primaryText,
        fontSize: 14,
        fontWeight: CustomFontWeight.medium),
    labelMedium: TextStyle(
        color: colors.primaryText,
        fontSize: 12,
        fontWeight: CustomFontWeight.medium),
    labelSmall: TextStyle(
        color: colors.primaryText,
        fontSize: 11,
        fontWeight: CustomFontWeight.medium),
    bodyLarge: TextStyle(
      color: colors.primaryText,
      fontSize: 16,
      fontWeight: CustomFontWeight.normal,
    ),
    bodyMedium: TextStyle(
        color: colors.secondaryText,
        fontSize: 14,
        fontWeight: CustomFontWeight.medium),
    bodySmall: TextStyle(
        color: colors.primaryText,
        fontSize: 14,
        fontWeight: CustomFontWeight.medium),
  );
}
