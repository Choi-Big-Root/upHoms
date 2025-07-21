import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/theme/theme_extension.dart';

class CustomPropertyTextField extends StatefulWidget {
  const CustomPropertyTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.textInputType,
    this.padding = const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
    this.maxLine = 1,
    this.validator,
  });

  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String hintText;
  final EdgeInsetsDirectional padding;
  final int maxLine;
  final String? Function(String?)? validator;

  @override
  State<CustomPropertyTextField> createState() =>
      _CustomPropertyTextFieldState();
}

class _CustomPropertyTextFieldState extends State<CustomPropertyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        focusNode: FocusNode(),
        maxLines: widget.maxLine,
        obscureText: false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: GoogleFonts.urbanist(
            textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: context.colors.grayIcon,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0x00000000), width: 1.0),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0x00000000), width: 1.0),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          contentPadding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
        ),
        style: GoogleFonts.urbanist(
          textStyle: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: context.colors.grayIcon),
        ),
        validator:widget.validator,
      ),
    );
  }
}
