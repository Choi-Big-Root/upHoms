import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/custom/custom_font_weight.dart';
import '../../core/theme/theme_extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final testList = [
    ['test_title0', 'test_descript0', 4.8],
    ['test_title1', 'test_descript1', 4.2],
    ['test_title2', 'test_descript2', 4.1],
    ['test_title3', 'test_descript3', 4.9],
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.primaryBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: colorScheme.dark600,
                boxShadow: [
                  const BoxShadow(
                    blurRadius: 3,
                    color: Color(0x39000000),
                    offset: Offset(0.0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 40, 0, 0),
                    child: Image.network(
                      'https://picsum.photos/id/338/160/50.jpg',
                      width: 160,
                      height: 50,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                      24,
                      12,
                      24,
                      8,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'WelCome!',
                          style: GoogleFonts.urbanist(
                            textStyle: textScheme.displaySmall?.copyWith(
                              color: colorScheme.tertiary,
                            ),
                            letterSpacing: 0.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Find your Dream Space To Getaway',
                          style: GoogleFonts.urbanist(
                            textStyle: textScheme.titleSmall?.copyWith(
                              color: colorScheme.grayIcon,
                              fontWeight: CustomFontWeight.light,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                      16,
                      16,
                      16,
                      0,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: colorScheme.primaryBackground,
                        borderRadius: BorderRadius.circular(30),
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
                            child: SizedBox(
                              width: 100,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.push('/property_search');
                                },
                                style: ButtonStyle(
                                  padding: WidgetStateProperty.all(
                                    const EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      0,
                                      0,
                                      0,
                                    ),
                                  ),
                                  backgroundColor: WidgetStateProperty.all(
                                    colorScheme.primary,
                                  ),
                                  elevation: WidgetStateProperty.all(3.0),
                                  side: WidgetStateProperty.all(
                                    const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                  ),
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Search',
                                  style: GoogleFonts.urbanist(
                                    textStyle: textScheme.titleSmall?.copyWith(
                                      color: Colors.white,
                                    ),
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: testList.length,
                itemBuilder: (context, index) {
                  final testData = testList[index];
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
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              child: CachedNetworkImage(
                                fadeInDuration: const Duration(
                                  milliseconds: 500,
                                ),
                                fadeOutDuration: const Duration(
                                  milliseconds: 500,
                                ),
                                imageUrl:
                                    'https://picsum.photos/id/238/200/200.jpg',
                                width: double.infinity,
                                height: 190,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                16,
                                12,
                                16,
                                8,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      testData[0].toString(),
                                      style: GoogleFonts.urbanist(
                                        textStyle: textScheme.headlineSmall,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                16,
                                0,
                                16,
                                8,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      testData[1].toString(),
                                      style: GoogleFonts.urbanist(
                                        textStyle: textScheme.bodyMedium,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ),
                                ],
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
                                        testData[2].toString(),
                                        style: GoogleFonts.urbanist(
                                          textStyle: textScheme.bodyMedium,
                                          letterSpacing: 0.0,
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
                                        style: GoogleFonts.urbanist(
                                          textStyle: textScheme.bodyMedium,
                                          letterSpacing: 0.0,
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
    );
  }
}
