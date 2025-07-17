import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/custom/custom_button_widget.dart';
import '../../../../core/custom/custom_font_weight.dart';
import '../../../../core/theme/theme_extension.dart';
import 'common/custom_property_app_bar.dart';
import 'common/custom_property_textfield.dart';
import 'common/custom_property_textfield_dec.dart';

class PropertyStep1Widget extends StatefulWidget {
  const PropertyStep1Widget({super.key});

  @override
  State<PropertyStep1Widget> createState() => _PropertyStep1WidgetState();
}

class _PropertyStep1WidgetState extends State<PropertyStep1Widget> {
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
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {},
                            child: Container(
                              width: double.infinity,
                              height: 180,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),

                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://picsum.photos/id/328/200/200.jpg',
                                  fadeOutDuration: const Duration(
                                    milliseconds: 500,
                                  ),
                                  fadeInDuration: const Duration(
                                    milliseconds: 500,
                                  ),
                                  width: double.infinity,
                                  height: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const CustomPropertyTextFieldDec(
                            title: 'PROPERTY NAME',
                            topPadding: 12,
                          ),
                          const CustomPropertyTextField(
                            hintText: 'Something Catchy...',
                          ),

                          const CustomPropertyTextFieldDec(
                            title: 'PROPERTY ADDRESS',
                            topPadding: 8,
                          ),
                          const CustomPropertyTextField(
                            hintText: '123 Disney way here...',
                            maxLine: 2,
                          ),

                          const CustomPropertyTextFieldDec(
                            title: 'NEIGHBORHOOD',
                            topPadding: 8,
                          ),
                          const CustomPropertyTextField(
                            hintText: 'Something Catchy...',
                          ),

                          const CustomPropertyTextFieldDec(
                            title: 'DESCRIPTION',
                            topPadding: 8,
                          ),
                          const CustomPropertyTextField(
                            hintText: 'Neighborhood or city...',
                            maxLine: 4,
                            padding: EdgeInsetsDirectional.fromSTEB(
                              0,
                              4,
                              0,
                              12,
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
                            '1/3',
                            style: GoogleFonts.urbanist(
                              textStyle: textScheme.headlineMedium,
                            ),
                          ),
                        ],
                      ),
                      CustomButtonWidget(
                        color: colorScheme.primary,
                        onPressed: () {
                          context.push('/property_step2_widget');
                        },
                        elevation: 2.0,
                        circular: 60,
                        size: const Size(120, 50),
                        text: 'NEXT',
                        style: GoogleFonts.urbanist(
                          textStyle: textScheme.titleSmall?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
