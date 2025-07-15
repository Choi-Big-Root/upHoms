import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/custom/custom_font_weight.dart';
import '../../core/theme/theme_extension.dart';

class PropertyBookNowWidget extends StatefulWidget {
  const PropertyBookNowWidget({super.key});

  @override
  State<PropertyBookNowWidget> createState() => _PropertyBookNowWidgetState();
}

class _PropertyBookNowWidgetState extends State<PropertyBookNowWidget> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.secondaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                      20,
                      50,
                      20,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: const Color(0x3A000000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            width: 46,
                            height: 46,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            12,
                            0,
                            0,
                            0,
                          ),
                          child: Text(
                            'Book Now',
                            style: GoogleFonts.urbanist(
                              textStyle: textScheme.headlineMedium,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://picsum.photos/id/338/200/200.jpg',
                            fadeOutDuration: const Duration(milliseconds: 500),
                            fadeInDuration: const Duration(milliseconds: 500),
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                      24,
                      12,
                      24,
                      0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            '[propertyName]',
                            style: GoogleFonts.urbanist(
                              textStyle: textScheme.displaySmall,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                      24,
                      4,
                      24,
                      12,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            '[propertyNeighborhood]',
                            style: GoogleFonts.lexendDeca(
                              fontWeight: CustomFontWeight.normal,
                              fontSize: 12,
                              color: const Color(0xFF8B97A2),
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2,
                    thickness: 1,
                    indent: 12,
                    endIndent: 12,
                    color: colorScheme.lineGray,
                  ),
                  //Padding(padding: )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
