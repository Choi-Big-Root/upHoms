import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/custom/custom_button_widget.dart';
import '../../../../core/theme/theme_extension.dart';
import 'common/custom_property_app_bar.dart';
import 'common/custom_property_textfield.dart';
import 'common/custom_property_textfield_dec.dart';

class PropertyStep3Widget extends StatefulWidget {
  const PropertyStep3Widget({super.key});

  @override
  State<PropertyStep3Widget> createState() => _PropertyStep3WidgetState();
}

class _PropertyStep3WidgetState extends State<PropertyStep3Widget> {
  bool isLive = false;

  int _guestCount = 1;

  void _increment() {
    setState(() {
      if (_guestCount < 8) _guestCount++;
    });
  }

  void _decrement() {
    setState(() {
      if (_guestCount > 1) _guestCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.secondaryBackground,
      appBar: const CustomPropertyAppBar(),
      body: SafeArea(
        top: true,
        child: Form(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const CustomPropertyTextFieldDec(
                            title: 'PRICE PER NIGHT',
                            topPadding: 12,
                          ),
                          const CustomPropertyTextField(hintText: '\$ Price'),
                          const CustomPropertyTextFieldDec(
                            title: 'MINIMUM NIGHT STAY',
                            topPadding: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: colorScheme.secondaryBackground,
                                    borderRadius: BorderRadius.circular(40),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: colorScheme.lineGray,
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          10,
                                          0,
                                          10,
                                          0,
                                        ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            _decrement();
                                          },
                                          icon: Icon(
                                            Icons.remove,
                                            color: colorScheme.grayIcon,
                                          ),
                                        ),
                                        Text(
                                          '$_guestCount',
                                          style: GoogleFonts.urbanist(
                                            textStyle:
                                                textScheme.headlineMedium,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            _increment();
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            color: colorScheme.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Divider(
                            color: colorScheme.lineGray,
                            height: 32,
                            thickness: 2,
                          ),

                          const CustomPropertyTextFieldDec(
                            title: 'TAX RATE',
                            topPadding: 8,
                          ),
                          const CustomPropertyTextField(hintText: '% Rate'),

                          const CustomPropertyTextFieldDec(
                            title: 'CLEANING FEE',
                            topPadding: 8,
                          ),
                          const CustomPropertyTextField(hintText: '\$ Price'),

                          const CustomPropertyTextFieldDec(
                            title: 'Additional Notes',
                            topPadding: 8,
                          ),
                          const CustomPropertyTextField(
                            hintText: 'Additional notes...',
                            padding: EdgeInsetsDirectional.fromSTEB(
                              0,
                              4,
                              0,
                              12,
                            ),
                            maxLine: 3,
                          ),
                          Divider(
                            color: colorScheme.lineGray,
                            height: 1,
                            thickness: 2,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: Material(
                              color: Colors.transparent,
                              child: SwitchListTile.adaptive(
                                value: isLive,
                                onChanged: (newValue) async {
                                  setState(() {
                                    isLive = newValue;
                                  });
                                },
                                title: Text(
                                  'Listing is Live',
                                  style: GoogleFonts.urbanist(
                                    textStyle: textScheme.headlineSmall,
                                  ),
                                ),
                                subtitle: Text(
                                  'Turn this on for guests to start booking your listing.',
                                  style: GoogleFonts.urbanist(
                                    textStyle: textScheme.bodyMedium,
                                  ),
                                ),
                                tileColor: context.colors.secondaryBackground,
                                activeTrackColor: const Color(0xFF392BBA),
                                inactiveTrackColor: Colors.white,
                                inactiveThumbColor: context.colors.secondaryText,
                                dense: false,
                                controlAffinity: ListTileControlAffinity.trailing,
                                contentPadding: const EdgeInsets.all(0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'STEP',
                            style: GoogleFonts.urbanist(
                              textStyle: textScheme.bodyMedium,
                            ),
                          ),
                          Text(
                            '3/3',
                            style: GoogleFonts.urbanist(
                              textStyle: textScheme.headlineMedium,
                            ),
                          ),
                        ],
                      ),
                      CustomButtonWidget(
                        color: colorScheme.turquoise,
                        onPressed: () {
                          context.go('/profile');
                        },
                        elevation: 2.0,
                        circular: 60,
                        size: const Size(200, 50),
                        text: 'Save Changes',
                        style: GoogleFonts.urbanist(
                          textStyle: textScheme.headlineSmall?.copyWith(
                            color: colorScheme.tertiary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Generated code for this SwitchListTile Widget...
              ],
            ),
          ),
        ),
      ),
    );
  }
}
