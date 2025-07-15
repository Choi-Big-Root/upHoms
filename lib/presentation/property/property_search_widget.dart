import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/custom/custom_font_weight.dart';
import '../../core/theme/theme_extension.dart';

class PropertySearchWidget extends StatefulWidget {
  const PropertySearchWidget({super.key});

  @override
  State<PropertySearchWidget> createState() => _PropertySearchWidgetState();
}

class _PropertySearchWidgetState extends State<PropertySearchWidget> {
  final testList = [
    ['test_title0', 'test_descript0', 4.8],
    ['test_title1', 'test_descript1', 4.2],
    ['test_title2', 'test_descript2', 4.1],
    ['test_title3', 'test_descript3', 4.9],
    ['test_title4', 'test_descript4', 4.9],
    ['test_title5', 'test_descript5', 4.9],
    ['test_title6', 'test_descript6', 4.9],
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.primaryBackground,
      appBar: AppBar(
        backgroundColor: colorScheme.dark600,
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
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF95A1AC),
              size: 25,
            ),
          ),
        ),
        title: Text(
          'Search',
          style: GoogleFonts.lexendDeca(
            textStyle: textScheme.titleMedium?.copyWith(
              color: colorScheme.tertiary,
              letterSpacing: 0.0,
            ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorScheme.dark600,
                  boxShadow: [
                    const BoxShadow(
                      blurRadius: 3,
                      color: Color(0x39000000),
                      offset: Offset(0.0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 4, 0),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: const AlignmentDirectional(0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              4,
                              0,
                              4,
                              0,
                            ),
                            child: TextFormField(
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Address, city, state...',
                                labelStyle: GoogleFonts.urbanist(
                                  textStyle: textScheme.bodyMedium?.copyWith(
                                    color: colorScheme.grayIcon,
                                  ),
                                  letterSpacing: 0.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: Icon(
                                  Icons.search_sharp,
                                  color: colorScheme.grayIcon,
                                ),
                              ),
                              style: GoogleFonts.urbanist(
                                textStyle: textScheme.bodyMedium?.copyWith(
                                  color: colorScheme.tertiary,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            0,
                            0,
                            8,
                            0,
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(100, 40),
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                0,
                                0,
                                0,
                                0,
                              ),
                              backgroundColor: colorScheme.primary,
                              elevation: 2,
                              side: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: Text(
                              'Search',
                              style: GoogleFonts.urbanist(
                                textStyle: textScheme.titleSmall?.copyWith(
                                  color: Colors.white,
                                  letterSpacing: 0.0,
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
              Padding(
                padding: const EdgeInsetsGeometry.fromSTEB(0, 12, 0, 0),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: testList.length,
                  itemBuilder: (context, listViewIndex) {
                    final testData = testList[listViewIndex];
                    return Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        16,
                        0,
                        16,
                        12,
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: colorScheme.secondaryBackground,
                          boxShadow: [
                            const BoxShadow(
                              blurRadius: 4,
                              color: Color(0x32000000),
                              offset: Offset(0.0, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            context.push('/property_details');
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://picsum.photos/id/338/200/200.jpg',
                                  fadeInDuration: const Duration(
                                    milliseconds: 500,
                                  ),
                                  fadeOutDuration: const Duration(
                                    milliseconds: 500,
                                  ),
                                  width: double.infinity,
                                  height: 190,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  16,
                                  8,
                                  0,
                                  0,
                                ),
                                child: Text(
                                  '[propertyName]',
                                  style: GoogleFonts.urbanist(
                                    textStyle: textScheme.headlineSmall
                                        ?.copyWith(
                                          color: colorScheme.darkText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  16,
                                  4,
                                  0,
                                  0,
                                ),
                                child: Text(
                                  '[propertyNeighborhood]',
                                  style: GoogleFonts.lexendDeca(
                                    textStyle: textScheme.bodySmall?.copyWith(
                                      color: colorScheme.grayIcon,
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    16,
                                    0,
                                    24,
                                    12,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Icon(
                                        Icons.star_rounded,
                                        color: Color(0xFFFFA130),
                                        size: 24,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                              4,
                                              0,
                                              0,
                                              0,
                                            ),
                                        child: Text(
                                          '[ratingSummaryList(a)]',
                                          style: GoogleFonts.lexendDeca(
                                            textStyle: textScheme.bodySmall
                                                ?.copyWith(
                                                  fontWeight:
                                                      CustomFontWeight.normal,
                                                  fontSize: 12,
                                                  color: const Color(
                                                    0xFF8B97A2,
                                                  ),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                              2,
                                              0,
                                              0,
                                              0,
                                            ),
                                        child: Text(
                                          'Rating',
                                          style: GoogleFonts.lexendDeca(
                                            textStyle: textScheme.bodySmall
                                                ?.copyWith(
                                                  fontWeight:
                                                      CustomFontWeight.normal,
                                                  fontSize: 12,
                                                  letterSpacing: 0.0,
                                                  color: const Color(0xFF8B97A2),
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
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
