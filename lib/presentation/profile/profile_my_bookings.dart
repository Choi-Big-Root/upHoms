import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/custom/custom_font_weight.dart';
import '../../core/theme/theme_extension.dart';
import '../../core/utils/image_viewer_utils.dart';
import '../common_widgets/review_trip_widget.dart';

class ProfileMyBookings extends StatefulWidget {
  const ProfileMyBookings({super.key});

  @override
  State<ProfileMyBookings> createState() => _ProfileMyBookingsState();
}

class _ProfileMyBookingsState extends State<ProfileMyBookings> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.secondaryBackground,
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
            size: 25,
          ),
        ),
        title: Text(
          'My Bookings',
          style: GoogleFonts.urbanist(textStyle: textScheme.headlineSmall),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: const Alignment(0, 0),
                  child: TabBar(
                    labelColor: colorScheme.turquoise,
                    unselectedLabelColor: colorScheme.grayIcon,
                    labelStyle: GoogleFonts.urbanist(
                      textStyle: textScheme.titleSmall?.copyWith(
                        fontWeight: CustomFontWeight.medium,
                      ),
                    ),
                    unselectedLabelStyle: const TextStyle(),
                    indicatorColor: colorScheme.turquoise,
                    indicatorWeight: 4,
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: _tabController,
                    tabs: [
                      const Tab(text: 'Published'),
                      const Tab(text: 'Drafts'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: colorScheme.primaryBackground,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            0,
                            8,
                            0,
                            0,
                          ),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: 4,
                            // 데이터로 수정
                            itemBuilder: (context, listViewIndex) {
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
                                        color: Color(0x32000000),
                                        blurRadius: 4,
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
                                      // mytrips detail 이동.
                                      context.push('/my_trip_details');
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            // 이미지 선택시 이미지 전체화면 표시
                                            //await Navigator.push(context,)
                                            showFullScreenImage(
                                              context,
                                              'https://picsum.photos/id/238/500/500.jpg',
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                            const BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                0,
                                              ),
                                              bottomRight:
                                              Radius.circular(0),
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(
                                                8,
                                              ),
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
                                              height: 140,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            16,
                                            12,
                                            16,
                                            8,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '[MMMEd]',
                                                style: GoogleFonts.urbanist(
                                                  textStyle: textScheme
                                                      .headlineSmall,
                                                ),
                                              ),
                                              Text(
                                                ' - ',
                                                style: GoogleFonts.urbanist(
                                                  textStyle: textScheme
                                                      .headlineSmall,
                                                ),
                                              ),
                                              Text(
                                                '[MMMEd]',
                                                style: GoogleFonts.urbanist(
                                                  textStyle: textScheme
                                                      .headlineSmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            16,
                                            0,
                                            16,
                                            0,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                  right: 12,
                                                ),
                                                child: Text(
                                                  '[propertyAddress]',
                                                  style: GoogleFonts.lexendDeca(
                                                    textStyle: textScheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                      color: colorScheme
                                                          .grayIcon,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '[\$1,234.56]',
                                                style: GoogleFonts.urbanist(
                                                  textStyle:
                                                  textScheme.titleMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            16,
                                            4,
                                            16,
                                            12,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                  left: 12,
                                                ),
                                                child: Text(
                                                  'Total',
                                                  style:
                                                  GoogleFonts.lexendDeca(
                                                    textStyle: textScheme
                                                        .bodyMedium,
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
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: colorScheme.primaryBackground,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            0,
                            8,
                            0,
                            0,
                          ),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: 4,
                            // 데이터로 수정
                            itemBuilder: (context, listViewIndex) {
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
                                        color: Color(0x32000000),
                                        blurRadius: 4,
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
                                      // mytrips detail 이동.
                                      context.push('/my_trip_details');
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            // 이미지 선택시 이미지 전체화면 표시
                                            //await Navigator.push(context,)
                                            showFullScreenImage(
                                              context,
                                              'https://picsum.photos/id/238/500/500.jpg',
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                            const BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                0,
                                              ),
                                              bottomRight:
                                              Radius.circular(0),
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(
                                                8,
                                              ),
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
                                              height: 140,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            16,
                                            12,
                                            16,
                                            8,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '[MMMEd]',
                                                style: GoogleFonts.urbanist(
                                                  textStyle: textScheme
                                                      .headlineSmall,
                                                ),
                                              ),
                                              Text(
                                                ' - ',
                                                style: GoogleFonts.urbanist(
                                                  textStyle: textScheme
                                                      .headlineSmall,
                                                ),
                                              ),
                                              Text(
                                                '[MMMEd]',
                                                style: GoogleFonts.urbanist(
                                                  textStyle: textScheme
                                                      .headlineSmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            16,
                                            0,
                                            16,
                                            0,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                  right: 12,
                                                ),
                                                child: Text(
                                                  '[propertyAddress]',
                                                  style: GoogleFonts.lexendDeca(
                                                    textStyle: textScheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                      color: colorScheme
                                                          .grayIcon,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '[\$1,234.56]',
                                                style: GoogleFonts.urbanist(
                                                  textStyle:
                                                  textScheme.titleMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            16,
                                            4,
                                            16,
                                            12,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                  left: 12,
                                                ),
                                                child: Text(
                                                  'Total',
                                                  style:
                                                  GoogleFonts.lexendDeca(
                                                    textStyle: textScheme
                                                        .bodyMedium,
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}