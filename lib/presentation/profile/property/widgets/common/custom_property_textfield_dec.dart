import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/theme/theme_extension.dart';

class CustomPropertyTextFieldDec extends StatelessWidget {
  const CustomPropertyTextFieldDec({super.key, required this.title, required this.topPadding});
  final String title;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
        0,
        topPadding,
        0,
        0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            title,
            style: GoogleFonts.urbanist(
              textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: context.colors.gray600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
