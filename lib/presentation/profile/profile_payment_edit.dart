import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/custom/custom_font_weight.dart';
import '../../core/theme/theme_extension.dart';
import '../common_widgets/credit_card_form.dart';

class ProfilePaymentEdit extends StatefulWidget {
  const ProfilePaymentEdit({super.key});

  @override
  State<ProfilePaymentEdit> createState() => _ProfilePaymentEditState();
}

class _ProfilePaymentEditState extends State<ProfilePaymentEdit> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.primaryBackground,
      appBar: AppBar(
        backgroundColor: colorScheme.secondaryBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: colorScheme.primaryText,
            size: 30,
          ),
        ),
        title: Text(
          'Payment Information',
          style: GoogleFonts.urbanist(textStyle: textScheme.headlineMedium),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorScheme.secondaryBackground,
                boxShadow: [
                  const BoxShadow(
                    color: Color(0x411D2429),
                    blurRadius: 5,
                    offset: Offset(0.0, 2),
                  ),
                ],
              ),
              child:  Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        16,
                        12,
                        16,
                        0,
                      ),
                      child: CreditCardForm(
                        obscureNumber: true,
                        obscureCvv: false,
                        spacing: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                      child: ElevatedButton(
                        onPressed: () {
                          context.pop();
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(colorScheme.turquoise),
                          elevation: WidgetStateProperty.all(3.0),
                          side: WidgetStateProperty.all(
                            const BorderSide(color: Colors.transparent, width: 1.0),
                          ),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          minimumSize: WidgetStateProperty.all(const Size(200, 50)),
                        ),
                        child: Text(
                          'Save Changes',
                          style: GoogleFonts.lexendDeca(
                            textStyle: textScheme.titleSmall?.copyWith(
                              fontWeight: CustomFontWeight.medium,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
