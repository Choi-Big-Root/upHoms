import 'package:flutter/material.dart';

class CustomFontWeight {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight normal = FontWeight.normal;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

extension TextStyleX on TextStyle? {
  TextStyle? get light => this?.copyWith(fontWeight: CustomFontWeight.light);

  TextStyle? get normal => this?.copyWith(fontWeight: CustomFontWeight.normal);

  TextStyle? get medium => this?.copyWith(fontWeight: CustomFontWeight.medium);

  TextStyle? get semiBold =>
      this?.copyWith(fontWeight: CustomFontWeight.semiBold);

  TextStyle? get bold => this?.copyWith(fontWeight: CustomFontWeight.bold);
}
