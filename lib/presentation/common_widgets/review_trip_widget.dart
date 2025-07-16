import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/custom/custom_font_weight.dart';
import '../../core/theme/theme_extension.dart';
import 'rating_bar_widget.dart';

class ReviewTripWidget extends StatelessWidget {
  const ReviewTripWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textScheme = Theme.of(context).textTheme;
    final colorScheme = context.colors;
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: colorScheme.secondaryBackground,
          boxShadow: [
            const BoxShadow(
              color: Color(0x35000000),
              blurRadius: 6,
              offset: Offset(6, -2),
            ),
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: Container(
                    width: 60,
                    height: 4,
                    decoration: BoxDecoration(
                      color: colorScheme.lineGray,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Rate Your Trip',
                      style: GoogleFonts.urbanist(
                        textStyle: textScheme.headlineSmall,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Let us know what you thought of the place below!',
                      style: GoogleFonts.urbanist(
                        textStyle: textScheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0,
                          4,
                          0,
                          0,
                        ),
                        child: Text(
                          'How would you rate it?',
                          style: GoogleFonts.urbanist(
                            textStyle: textScheme.bodySmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: RatingBarWidget(
                    starSize: 48,
                    activeColor: colorScheme.primary,
                    inactiveColor: colorScheme.lineGray,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: TextFormField(
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Please leave a description of the place...',
                      hintStyle: GoogleFonts.urbanist(
                        textStyle: textScheme.bodyMedium,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: colorScheme.lineGray,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: colorScheme.lineGray,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                    style: GoogleFonts.urbanist(textStyle: textScheme.bodySmall),
                    maxLines: 4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                    0,
                    32,
                    0,
                    0,
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                     context.go('/my_trips');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(300, 60),
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0,
                        0,
                        0,
                        0,
                      ),
                      backgroundColor: colorScheme.primary,
                      elevation: 3,
                      side: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Text(
                      'Submit Review',
                      style: GoogleFonts.urbanist(
                        textStyle: textScheme.headlineSmall?.copyWith(
                          color: colorScheme.tertiary,
                        ),
                      ),
                    ),
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
