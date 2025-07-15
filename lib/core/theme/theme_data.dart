import 'package:flutter/material.dart';
import 'constant/app_colors.dart';
import 'constant/app_dark_colors.dart';

@immutable
class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.alternate,
    required this.primaryText,
    required this.secondaryText,
    required this.primaryBackground,
    required this.secondaryBackground,
    required this.accent1,
    required this.accent2,
    required this.accent3,
    required this.accent4,
    required this.success,
    required this.error,
    required this.warring,
    required this.info,
    required this.cultured,
    required this.redApple,
    required this.celadon,
    required this.turquoise,
    required this.gunmetal,
    required this.grayIcon,
    required this.darkText,
    required this.dark600,
    required this.gray600,
    required this.lineGray,
  });

  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color alternate;
  final Color primaryText;
  final Color secondaryText;
  final Color primaryBackground;
  final Color secondaryBackground;
  final Color accent1;
  final Color accent2;
  final Color accent3;
  final Color accent4;
  final Color success;
  final Color error;
  final Color warring;
  final Color info;
  final Color cultured;
  final Color redApple;
  final Color celadon;
  final Color turquoise;
  final Color gunmetal;
  final Color grayIcon;
  final Color darkText;
  final Color dark600;
  final Color gray600;
  final Color lineGray;

  @override
  ThemeExtension<ThemeColors> copyWith() {
    return ThemeColors(
      primary: primary,
      secondary: secondary,
      tertiary: tertiary,
      alternate: alternate,
      primaryText: primaryText,
      secondaryText: secondaryText,
      primaryBackground: primaryBackground,
      secondaryBackground: secondaryBackground,
      accent1: accent1,
      accent2: accent2,
      accent3: accent3,
      accent4: accent4,
      success: success,
      error: error,
      warring: warring,
      info: info,
      cultured: cultured,
      redApple: redApple,
      celadon: celadon,
      turquoise: turquoise,
      gunmetal: gunmetal,
      grayIcon: grayIcon,
      darkText: darkText,
      dark600: dark600,
      gray600: gray600,
      lineGray: lineGray,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(covariant ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      primary: Color.lerp(primary, other.primary, t) ?? other.primary,
      secondary: Color.lerp(secondary, other.secondary, t) ?? other.secondary,
      tertiary: Color.lerp(tertiary, other.tertiary, t) ?? other.tertiary,
      alternate: Color.lerp(alternate, other.alternate, t) ?? other.alternate,
      primaryText: Color.lerp(primaryText, other.primaryText, t) ?? other.primaryText,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t) ?? other.secondaryText,
      primaryBackground: Color.lerp(primaryBackground, other.primaryBackground, t) ?? other.primaryBackground,
      secondaryBackground: Color.lerp(secondaryBackground, other.secondaryBackground, t) ?? other.secondaryBackground,
      accent1: Color.lerp(accent1, other.accent1, t) ?? other.accent1,
      accent2: Color.lerp(accent2, other.accent2, t) ?? other.accent2,
      accent3: Color.lerp(accent3, other.accent3, t) ?? other.accent3,
      accent4: Color.lerp(accent4, other.accent4, t) ?? other.accent4,
      success: Color.lerp(success, other.success, t) ?? other.success,
      error: Color.lerp(error, other.error, t) ?? other.error,
      warring: Color.lerp(warring, other.warring, t) ?? other.warring,
      info: Color.lerp(info, other.info, t) ?? other.info,
      cultured: Color.lerp(cultured, other.cultured, t) ?? other.cultured,
      redApple: Color.lerp(redApple, other.redApple, t) ?? other.redApple,
      celadon: Color.lerp(celadon, other.celadon, t) ?? other.celadon,
      turquoise: Color.lerp(turquoise, other.turquoise, t) ?? other.turquoise,
      gunmetal: Color.lerp(gunmetal, other.gunmetal, t) ?? other.gunmetal,
      grayIcon: Color.lerp(grayIcon, other.grayIcon, t) ?? other.grayIcon,
      darkText: Color.lerp(darkText, other.darkText, t) ?? other.darkText,
      dark600: Color.lerp(dark600, other.dark600, t) ?? other.dark600,
      gray600: Color.lerp(gray600, other.gray600, t) ?? other.gray600,
      lineGray: Color.lerp(lineGray, other.lineGray, t) ?? other.lineGray,
    );
  }

  static const light = ThemeColors(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    tertiary: AppColors.tertiary,
    alternate: AppColors.alternate,
    primaryText: AppColors.primaryText,
    secondaryText: AppColors.secondaryText,
    primaryBackground: AppColors.primaryBackground,
    secondaryBackground: AppColors.secondaryBackground,
    accent1: AppColors.accent1,
    accent2: AppColors.accent2,
    accent3: AppColors.accent3,
    accent4: AppColors.accent4,
    success: AppColors.success,
    error: AppColors.error,
    warring: AppColors.warring,
    info: AppColors.info,
    cultured: AppColors.cultured,
    redApple: AppColors.redApple,
    celadon: AppColors.celadon,
    turquoise: AppColors.turquoise,
    gunmetal: AppColors.gunmetal,
    grayIcon: AppColors.grayIcon,
    darkText: AppColors.darkText,
    dark600: AppColors.dark600,
    gray600: AppColors.gray600,
    lineGray: AppColors.lineGray,
  );

  static const ThemeColors dark = ThemeColors(
    primary: AppDarkColors.primary,
    secondary: AppDarkColors.secondary,
    tertiary: AppDarkColors.tertiary,
    alternate: AppDarkColors.alternate,
    primaryText: AppDarkColors.primaryText,
    secondaryText: AppDarkColors.secondaryText,
    primaryBackground: AppDarkColors.primaryBackground,
    secondaryBackground: AppDarkColors.secondaryBackground,
    accent1: AppDarkColors.accent1,
    accent2: AppDarkColors.accent2,
    accent3: AppDarkColors.accent3,
    accent4: AppDarkColors.accent4,
    success: AppDarkColors.success,
    error: AppDarkColors.error,
    warring: AppDarkColors.warring,
    info: AppDarkColors.info,
    cultured: AppDarkColors.cultured,
    redApple: AppDarkColors.redApple,
    celadon: AppDarkColors.celadon,
    turquoise: AppDarkColors.turquoise,
    gunmetal: AppDarkColors.gunmetal,
    grayIcon: AppDarkColors.grayIcon,
    darkText: AppDarkColors.darkText,
    dark600: AppDarkColors.dark600,
    gray600: AppDarkColors.gray600,
    lineGray: AppDarkColors.lineGray,
  );
}