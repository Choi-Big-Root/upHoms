import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/theme_extension.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  const CustomTextFormFieldWidget({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.labelText,
    required this.labelStyle,
    required this.hintText,
    required this.hintStyle,
    required this.contentPadding,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.onSaved,
  });

  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final TextStyle labelStyle;
  final String hintText;
  final TextStyle hintStyle;
  final EdgeInsetsDirectional contentPadding;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.lineGray, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.lineGray, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0X00000000), width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0X00000000), width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: colorScheme.secondaryBackground,
        contentPadding: widget.contentPadding,
        suffixIcon: widget.suffixIcon,
      ),
      style: GoogleFonts.urbanist(
        textStyle: Theme.of(context).textTheme.titleSmall,
      ),
      keyboardType: widget.keyboardType,
      validator:
          widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return '필수 입력사항 입니다.';
            }
            return null;
          },
      onSaved: widget.onSaved,
    );
  }
}
