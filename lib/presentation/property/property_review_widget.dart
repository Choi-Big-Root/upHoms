import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/custom/custom_font_weight.dart';
import '../../core/theme/theme_extension.dart';

class PropertyReviewWidget extends StatefulWidget {
  const PropertyReviewWidget({super.key});

  @override
  State<PropertyReviewWidget> createState() => _PropertyReviewWidgetState();
}

class _PropertyReviewWidgetState extends State<PropertyReviewWidget> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.primaryBackground,
      appBar: AppBar(
        backgroundColor: colorScheme.secondaryBackground,
        automaticallyImplyLeading: false,
        leading: Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: colorScheme.primaryText,
              size: 25,
            ),
          ),
        ),
        title: Text(
          'Reviews',
          style: GoogleFonts.urbanist(
            textStyle: textScheme.headlineSmall,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorScheme.secondaryBackground,
                  boxShadow: [
                    const BoxShadow(
                      color: Color(0x39000000),
                      offset: Offset(0.0, 1),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsetsGeometry.fromSTEB(12, 16, 12, 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsGeometry.fromSTEB(
                              0,
                              0,
                              0,
                              12,
                            ),
                            child: Text(
                              '0',
                              style: GoogleFonts.lexendDeca(
                                textStyle: textScheme.displaySmall?.copyWith(
                                  fontWeight: CustomFontWeight.bold,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '# of Ratings',
                            style: GoogleFonts.lexendDeca(
                              textStyle: textScheme.bodyMedium?.copyWith(
                                fontWeight: CustomFontWeight.normal,
                                fontSize: 12,
                                color: const Color(0xFF95A1AC),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  0,
                                  0,
                                  12,
                                ),
                                child: Text(
                                  '[rating]',
                                  style: GoogleFonts.lexendDeca(
                                    textStyle: textScheme.displaySmall
                                        ?.copyWith(
                                          fontWeight: CustomFontWeight.bold,
                                          fontSize: 28,
                                        ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                  4,
                                  0,
                                  0,
                                  12,
                                ),
                                child: Icon(
                                  Icons.star_rounded,
                                  color: Color(0xFFFFA130),
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Avg. Rating',
                            style: GoogleFonts.lexendDeca(
                              textStyle: textScheme.bodySmall?.copyWith(
                                fontWeight: CustomFontWeight.normal,
                                fontSize: 12,
                                color: const Color(0xFF8B97A2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, listViewIndex) {
                  return Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 4),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.96,
                      decoration: BoxDecoration(
                        color: colorScheme.secondaryBackground,
                        boxShadow: [
                          const BoxShadow(
                            blurRadius: 4,
                            offset: Offset(0.0, 2),
                            color: Color(0x33000000),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  16,
                                  12,
                                  16,
                                  0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '[display_name]',
                                            style: GoogleFonts.urbanist(
                                              textStyle:
                                                  textScheme.headlineSmall,
                                            ),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                  0,
                                                  4,
                                                  0,
                                                  4,
                                                ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFFFFA130),
                                                  size: 24,
                                                ),
                                                Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFF95A1AC),
                                                  size: 24,
                                                ),
                                                Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFF95A1AC),
                                                  size: 24,
                                                ),
                                                Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFF95A1AC),
                                                  size: 24,
                                                ),
                                                Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFF95A1AC),
                                                  size: 24,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: const Color(0xFFDBE2E7),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: CachedNetworkImage(
                                            fadeOutDuration: const Duration(
                                              milliseconds: 500,
                                            ),
                                            fadeInDuration: const Duration(
                                              milliseconds: 500,
                                            ),
                                            imageUrl:
                                                'https://picsum.photos/id/338/200/200.jpg',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  16,
                                  4,
                                  16,
                                  12,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '[ratingDescription]',
                                        style: GoogleFonts.urbanist(
                                          textStyle: textScheme.bodyMedium
                                              ?.copyWith(
                                                color:
                                                    colorScheme.secondaryText,
                                              ),
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
