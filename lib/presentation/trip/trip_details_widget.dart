import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/custom/custom_font_weight.dart';
import '../../core/theme/theme_extension.dart';
import '../bloc/property/property_bloc.bloc.dart';

class TripDetailsWidget extends StatefulWidget {
  const TripDetailsWidget({super.key, required this.propertyId, required this.kind, this.searchText});
  final Map<String,dynamic> propertyId;
  final String? kind;
  final String? searchText;

  @override
  State<TripDetailsWidget> createState() => _TripDetailsWidgetState();
}

class _TripDetailsWidgetState extends State<TripDetailsWidget>
    with TickerProviderStateMixin {
  
  @override
  void initState() {
    super.initState();
    context.read<PropertyBloc>().add(LoadProperty(widget.propertyId));
  }
  
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
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: 320,
                          decoration: BoxDecoration(
                            color: const Color(0xFFDBE2E7),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {},
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: CachedNetworkImage(
                                      fadeInDuration: const Duration(
                                        milliseconds: 500,
                                      ),
                                      fadeOutDuration: const Duration(
                                        milliseconds: 500,
                                      ),
                                      imageUrl:
                                          'https://picsum.photos/id/328/200/200.jpg',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {},
                                          child: SizedBox(
                                            width: 46,
                                            height: 46,
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color: const Color(0x3A000000),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: IconButton(
                                                onPressed: () {
                                                  if(widget.kind == 'home'){
                                                    context.read<PropertyBloc>().add(const LoadProperties());
                                                  }else if(widget.kind == 'search') {
                                                    context.read<PropertyBloc>().add(LoadSearchProperties({'searchText':widget.searchText}));
                                                  }
                                                  context.pop();
                                                },
                                                icon: const Icon(
                                                  Icons.arrow_back_rounded,
                                                  color: Colors.white,
                                                  size: 25,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsGeometry.fromSTEB(24, 12, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'API 데이터 타이틀',
                            style: GoogleFonts.urbanist(
                              textStyle: textScheme.displaySmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'API 데이터 서브 타이틀',
                            style: GoogleFonts.lexendDeca(
                              textStyle: textScheme.bodySmall?.copyWith(
                                color: const Color(0xFF8B97A2),
                                fontWeight: CustomFontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        context.push('/trip_review');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFFA130),
                            size: 24,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              8,
                              0,
                              0,
                              0,
                            ),
                            child: Text(
                              'API 데이터 리뷰점수',
                              style: GoogleFonts.lexendDeca(
                                textStyle: textScheme.bodySmall?.copyWith(
                                  fontWeight: CustomFontWeight.normal,
                                  fontSize: 12,
                                  color: const Color(0xFF8B97A2),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              2,
                              0,
                              0,
                              0,
                            ),
                            child: Text(
                              'Reviews',
                              style: GoogleFonts.lexendDeca(
                                textStyle: textScheme.bodySmall?.copyWith(
                                  fontWeight: CustomFontWeight.normal,
                                  fontSize: 12,
                                  color: const Color(0xFF8B97A2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                        Text(
                          'DESCRIPTION',
                          style: GoogleFonts.lexendDeca(
                            textStyle: textScheme.bodySmall?.copyWith(
                              fontWeight: CustomFontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              0,
                              0,
                              0,
                              24,
                            ),
                            child: Text(
                              'API 데이터 설명란',
                              style: GoogleFonts.lexendDeca(
                                textStyle: textScheme.bodySmall?.copyWith(
                                  fontWeight: CustomFontWeight.normal,
                                  color: const Color(0xFF8B97A2),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Amenities',
                          style: GoogleFonts.lexendDeca(
                            textStyle: textScheme.bodySmall?.copyWith(
                              fontWeight: CustomFontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 12, 0, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                0,
                                0,
                                8,
                                0,
                              ),
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: colorScheme.secondaryBackground,
                                  border: Border.all(
                                    color: colorScheme.lineGray,
                                  ),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: Icon(
                                  Icons.ev_station,
                                  color: colorScheme.grayIcon,
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
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: colorScheme.secondaryBackground,
                                  border: Border.all(
                                    color: colorScheme.lineGray,
                                  ),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: Icon(
                                  Icons.pool_rounded,
                                  color: colorScheme.grayIcon,
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
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: colorScheme.secondaryBackground,
                                  border: Border.all(
                                    color: colorScheme.lineGray,
                                  ),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: Icon(
                                  Icons.power_rounded,
                                  color: colorScheme.grayIcon,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Container(
                      width: double.infinity,
                      height: 260,
                      decoration: BoxDecoration(
                        color: colorScheme.primaryBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0,
                          12,
                          0,
                          12,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                24,
                                0,
                                24,
                                0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'What people are saying',
                                    style: GoogleFonts.urbanist(
                                      textStyle: textScheme.bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  8,
                                  0,
                                  0,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                              0,
                                              0,
                                              0,
                                              30,
                                            ),
                                        child: PageView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 4,
                                          itemBuilder: (context, pageViewIndex) {
                                            final pageViewReviewsRecord;
                                            return Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: Container(
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: colorScheme
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    const BoxShadow(
                                                      blurRadius: 5,
                                                      color: Color(0x24090F13),
                                                      offset: Offset(0.0, 2),
                                                    ),
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    12,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                '[API 데이터 타이틀]',
                                                                style: GoogleFonts.urbanist(
                                                                  textStyle:
                                                                      textScheme
                                                                          .headlineSmall,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                              ),
                                                              const Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional.fromSTEB(
                                                                      0,
                                                                      4,
                                                                      0,
                                                                      0,
                                                                    ),
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: Color(
                                                                        0xFFFFA130,
                                                                      ),
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: Color(
                                                                        0xFFD6D9DB,
                                                                      ),
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: Color(
                                                                        0xFFD6D9DB,
                                                                      ),
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: Color(
                                                                        0xFFD6D9DB,
                                                                      ),
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: Color(
                                                                        0xFFD6D9DB,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: 50,
                                                            height: 50,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                            child: Image.network(
                                                              'https://picsum.photos/id/238/200/200.jpg',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional.fromSTEB(
                                                              0,
                                                              8,
                                                              0,
                                                              0,
                                                            ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional.fromSTEB(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    24,
                                                                  ),
                                                              child: Text(
                                                                '[API 데이터 리뷰 DESCRIPTION]',
                                                                style: GoogleFonts.lexendDeca(
                                                                  textStyle: textScheme
                                                                      .bodySmall
                                                                      ?.copyWith(
                                                                        fontWeight:
                                                                            CustomFontWeight.normal,
                                                                        color: const Color(
                                                                          0xFF8B97A2,
                                                                        ),
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
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: colorScheme.primaryText,
              boxShadow: [
                const BoxShadow(
                  blurRadius: 4,
                  color: Color(0x55000000),
                  offset: Offset(0.0, 2),
                ),
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 40),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '\$156',
                            style: GoogleFonts.urbanist(
                              textStyle: textScheme.headlineSmall?.copyWith(
                                color: colorScheme.secondaryBackground,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              4,
                              0,
                              0,
                              0,
                            ),
                            child: Text(
                              '+ taxes/fees',
                              style: GoogleFonts.lexendDeca(
                                textStyle: textScheme.bodySmall?.copyWith(
                                  fontWeight: CustomFontWeight.normal,
                                  color: const Color(0xFF8B97A2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0,
                          4,
                          0,
                          0,
                        ),
                        child: Text(
                          'per night',
                          style: GoogleFonts.lexendDeca(
                            textStyle: textScheme.bodySmall?.copyWith(
                              fontWeight: CustomFontWeight.normal,
                              color: const Color(0xFF8B97A2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.push('/trip_book_now');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(130, 50),
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      backgroundColor: colorScheme.primary,
                      elevation: 3,
                      side: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Book Now',
                      style: GoogleFonts.lexendDeca(
                        textStyle: textScheme.titleSmall?.copyWith(
                          fontWeight: CustomFontWeight.medium,
                          color: Colors.white,
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
    );
  }
}
