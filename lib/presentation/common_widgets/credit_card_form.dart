import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/theme_extension.dart';

class CreditCardForm extends StatefulWidget {
  const CreditCardForm({
    super.key,
    required this.obscureNumber,
    required this.obscureCvv,
    required this.spacing,
  });

  final bool obscureNumber;
  final bool obscureCvv;
  final double spacing;

  @override
  State<CreditCardForm> createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  late TextEditingController _controllerExpDate;

  @override
  void initState() {
    super.initState();
    _controllerExpDate = TextEditingController();
    _controllerExpDate.addListener(() {
      final raw = _controllerExpDate.text.replaceAll(RegExp(r'[^0-9]'), '');
      if (raw.length <= 4) {
        final formatted = _formatDate(raw);
        if (_controllerExpDate.text != formatted) {
          final cursorPos = formatted.length;
          _controllerExpDate.value = TextEditingValue(
            text: formatted,
            selection: TextSelection.collapsed(offset: cursorPos),
          );
        }
      }
    });
  }

  String _formatDate(String value) {
    if (value.length <= 2) return value;
    return '${value.substring(0, 2)}/${value.substring(2)}';
  }

  @override
  void dispose() {
    super.dispose();
    _controllerExpDate.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: widget.spacing),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  obscureText: widget.obscureNumber,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, //0~9문자만 허용.
                    LengthLimitingTextInputFormatter(16),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Card number',
                    labelStyle: GoogleFonts.urbanist(
                      textStyle: textScheme.bodyMedium?.copyWith(
                        color: colorScheme.primaryText,
                      ),
                    ),
                    hintText: 'XXXX XXXX XXXX XXXX',
                    hintStyle: GoogleFonts.urbanist(
                      textStyle: textScheme.bodyMedium?.copyWith(
                        color: colorScheme.primaryText,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorScheme.lineGray,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorScheme.lineGray,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0X00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0X00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: colorScheme.secondaryBackground,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                obscureText: false,
                controller: _controllerExpDate,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                decoration: InputDecoration(
                  labelText: 'Exp.Date',
                  labelStyle: GoogleFonts.urbanist(
                    textStyle: textScheme.bodyMedium?.copyWith(
                      color: colorScheme.primaryText,
                    ),
                  ),
                  hintText: 'MM/YY',
                  hintStyle: GoogleFonts.urbanist(
                    textStyle: textScheme.bodyMedium?.copyWith(
                      color: colorScheme.primaryText,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorScheme.lineGray,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorScheme.lineGray,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0X00000000),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0X00000000),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: colorScheme.secondaryBackground,
                ),
              ),
            ),
            SizedBox(width: widget.spacing),
            Expanded(
              child: TextFormField(
                obscureText: widget.obscureCvv,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                decoration: InputDecoration(
                  labelText: 'CVV',
                  labelStyle: GoogleFonts.urbanist(
                    textStyle: textScheme.bodyMedium?.copyWith(
                      color: colorScheme.primaryText,
                    ),
                  ),
                  hintText: 'XXXX',
                  hintStyle: GoogleFonts.urbanist(
                    textStyle: textScheme.bodyMedium?.copyWith(
                      color: colorScheme.primaryText,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorScheme.lineGray,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorScheme.lineGray,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0X00000000),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0X00000000),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: colorScheme.secondaryBackground,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
