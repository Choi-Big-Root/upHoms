import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/theme/theme_extension.dart';

class CustomPropertyAmenlty extends StatefulWidget {
  const CustomPropertyAmenlty({
    super.key,
    required this.text,
    required this.switchVal,
    required this.onChanged, 
  });

  final String text;
  final bool switchVal;
  final ValueChanged<bool> onChanged;

  @override
  State<CustomPropertyAmenlty> createState() => _CustomPropertyAmenltyState();
}

class _CustomPropertyAmenltyState extends State<CustomPropertyAmenlty> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SwitchListTile.adaptive(
        value: widget.switchVal,
        onChanged: (newValue) {
          widget.onChanged(newValue);
        },
        title: Text(
          widget.text,
          style: GoogleFonts.urbanist(
            textStyle: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        tileColor: context.colors.secondaryBackground,
        activeTrackColor: const Color(0xFF392BBA),
        inactiveTrackColor: Colors.white,
        inactiveThumbColor: context.colors.secondaryText,
        dense: false,
        controlAffinity: ListTileControlAffinity.trailing,
        contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
      ),
    );
  }
}