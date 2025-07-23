import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../core/constants.dart';
import '../../core/custom/custom_font_weight.dart';
import '../../core/theme/theme_extension.dart';
import '../../core/utils/image_viewer_utils.dart';
import '../../domain/model/property/property_model.dart';
import '../../domain/model/trip/trip_model.dart';
import '../bloc/property/property_bloc.bloc.dart';
import '../bloc/trip/trip_bloc.bloc.dart' hide Success;
import '../bloc/user/user_bloc.bloc.dart';
import '../common_widgets/review_trip_widget.dart';

class ProfileMyBookings extends StatefulWidget {
  const ProfileMyBookings({super.key, required this.hostId});

  final String hostId;

  @override
  State<ProfileMyBookings> createState() => _ProfileMyBookingsState();
}

class _ProfileMyBookingsState extends State<ProfileMyBookings>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<TripBloc>().add(GetTripsWithHost({'hostId': widget.hostId}));
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
            context.go('/profile');
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
                      const Tab(text: 'UpComing'),
                      const Tab(text: 'Complete'),
                    ],
                  ),
                ),
                BlocBuilder<UserBloc, UserState>(
                  buildWhen: (previous, current) => current is Success,
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      success: (user) {
                        return BlocBuilder<TripBloc, TripState>(
                          buildWhen: (previous, current) =>
                              current is GetTripsWithHostSuccess,
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () => const SizedBox.shrink(),
                              getTripsWithHostSuccess: (trips) {
                                List<TripModel> tripsUpcoming = trips
                                    .where((trip) => trip.upcoming == true)
                                    .toList();
                                List<TripModel> tripsComplete = trips
                                    .where((trip) => trip.complete == true)
                                    .toList();
                                return Expanded(
                                  child: TabBarView(
                                    controller: _tabController,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        color: colorScheme.primaryBackground,
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
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
                                            itemCount: tripsUpcoming.length,
                                            // 데이터로 수정
                                            itemBuilder: (context, index) {
                                              final upcomingData = tripsUpcoming[index];
                                              final DateFormat desiredFormatter =
                                              DateFormat('yyyy-MM-dd');
                                              DateTime dateTimeBegin = DateTime.parse(
                                                upcomingData.tripBeginDate!,
                                              );
                                              DateTime dateTimeEnd = DateTime.parse(
                                                upcomingData.tripEndDate!,
                                              );
                                              String tripBeginDate = desiredFormatter
                                                  .format(dateTimeBegin);
                                              String tripEndDate = desiredFormatter
                                                  .format(dateTimeEnd);
                                              return Padding(
                                                padding:
                                                    const EdgeInsetsDirectional.fromSTEB(
                                                      16,
                                                      0,
                                                      16,
                                                      12,
                                                    ),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: colorScheme
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      const BoxShadow(
                                                        color: Color(
                                                          0x32000000,
                                                        ),
                                                        blurRadius: 4,
                                                        offset: Offset(0.0, 2),
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                  ),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () {
                                                      // mytrips detail 이동.
                                                      String tripIdText =
                                                      Uri.encodeComponent(
                                                        upcomingData.tripId
                                                            .toString(),
                                                      );
                                                      context.go(
                                                        '/my_trip_details?tripId=$tripIdText&mode=trip',
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () {
                                                            // 이미지 선택시 이미지 전체화면 표시
                                                            //await Navigator.push(context,)
                                                            showFullScreenImage(
                                                              context,
                                                              upcomingData
                                                                  .property!
                                                                  .mainImage ??
                                                                  '',
                                                            );
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius: const BorderRadius.only(
                                                              bottomLeft:
                                                                  Radius.circular(
                                                                    0,
                                                                  ),
                                                              bottomRight:
                                                                  Radius.circular(
                                                                    0,
                                                                  ),
                                                              topLeft:
                                                                  Radius.circular(
                                                                    8,
                                                                  ),
                                                              topRight:
                                                                  Radius.circular(
                                                                    8,
                                                                  ),
                                                            ),
                                                            child:
                                                            upcomingData
                                                                .property!
                                                                .mainImage !=
                                                                null &&
                                                                upcomingData
                                                                    .property!
                                                                    .mainImage!
                                                                    .startsWith(
                                                                  'data:image',
                                                                )
                                                                ? Image.memory(
                                                              base64Decode(
                                                                upcomingData
                                                                    .property!
                                                                    .mainImage!
                                                                    .split(',')
                                                                    .last,
                                                              ),
                                                              width:
                                                              MediaQuery.sizeOf(
                                                                context,
                                                              ).width *
                                                                  0.9,
                                                              height: 140,
                                                              fit: BoxFit.cover,
                                                            )
                                                                : CachedNetworkImage(
                                                              fadeInDuration:
                                                              const Duration(
                                                                milliseconds:
                                                                500,
                                                              ),
                                                              fadeOutDuration:
                                                              const Duration(
                                                                milliseconds:
                                                                500,
                                                              ),
                                                              imageUrl:
                                                              upcomingData
                                                                  .property!
                                                                  .mainImage ??
                                                                  'https://picsum.photos/id/238/200/200.jpg',
                                                              width:
                                                              MediaQuery.sizeOf(
                                                                context,
                                                              ).width *
                                                                  0.9,
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
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                tripBeginDate,
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
                                                                tripEndDate,
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
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets.only(
                                                                        right: 12,
                                                                      ),
                                                                  child: Text(
                                                                    upcomingData
                                                                        .property!
                                                                        .propertyAddress!,
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
                                                              ),
                                                              Text(
                                                                AppConstants.formatPrice(
                                                                  upcomingData
                                                                      .tripTotal,
                                                                  locale: 'en_US',
                                                                  symbol: '\$',
                                                                ),
                                                                style: GoogleFonts.urbanist(
                                                                  textStyle: textScheme
                                                                      .titleMedium,
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
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets.only(
                                                                      left: 12,
                                                                    ),
                                                                child: Text(
                                                                  'Total ${AppConstants.formatPrice(upcomingData.tripCost, locale: 'en_US', symbol: '\$')}',
                                                                  style: GoogleFonts.lexendDeca(
                                                                    textStyle:
                                                                    textScheme
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
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
                                            itemCount: tripsComplete.length,
                                            // 데이터로 수정
                                            itemBuilder: (context, index) {
                                              final completeData =
                                              tripsComplete[index];
                                              final DateFormat desiredFormatter =
                                              DateFormat('yyyy-MM-dd');
                                              DateTime dateTimeBegin = DateTime.parse(
                                                completeData.tripBeginDate!,
                                              );
                                              DateTime dateTimeEnd = DateTime.parse(
                                                completeData.tripEndDate!,
                                              );
                                              String tripBeginDate = desiredFormatter
                                                  .format(dateTimeBegin);
                                              String tripEndDate = desiredFormatter
                                                  .format(dateTimeEnd);
                                              return Padding(
                                                padding:
                                                    const EdgeInsetsDirectional.fromSTEB(
                                                      16,
                                                      0,
                                                      16,
                                                      12,
                                                    ),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: colorScheme
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      const BoxShadow(
                                                        color: Color(
                                                          0x32000000,
                                                        ),
                                                        blurRadius: 4,
                                                        offset: Offset(0.0, 2),
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                  ),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () {
                                                      // mytrips detail 이동.
                                                      String tripIdText =
                                                      Uri.encodeComponent(
                                                        completeData.tripId
                                                            .toString(),
                                                      );
                                                      context.go(
                                                        '/my_trip_details?tripId=$tripIdText&mode=trip',
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () {
                                                            // 이미지 선택시 이미지 전체화면 표시
                                                            //await Navigator.push(context,)
                                                            showFullScreenImage(
                                                              context,
                                                              completeData
                                                                  .property!
                                                                  .mainImage ??
                                                                  '',
                                                            );
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius: const BorderRadius.only(
                                                              bottomLeft:
                                                              Radius.circular(
                                                                0,
                                                              ),
                                                              bottomRight:
                                                              Radius.circular(
                                                                0,
                                                              ),
                                                              topLeft:
                                                              Radius.circular(
                                                                8,
                                                              ),
                                                              topRight:
                                                              Radius.circular(
                                                                8,
                                                              ),
                                                            ),
                                                            child:
                                                            completeData
                                                                .property!
                                                                .mainImage !=
                                                                null &&
                                                                completeData
                                                                    .property!
                                                                    .mainImage!
                                                                    .startsWith(
                                                                  'data:image',
                                                                )
                                                                ? Image.memory(
                                                              base64Decode(
                                                                completeData
                                                                    .property!
                                                                    .mainImage!
                                                                    .split(
                                                                  ',',
                                                                )
                                                                    .last,
                                                              ),
                                                              width:
                                                              MediaQuery.sizeOf(
                                                                context,
                                                              ).width *
                                                                  0.9,
                                                              height: 140,
                                                              fit: BoxFit
                                                                  .cover,
                                                            )
                                                                : CachedNetworkImage(
                                                              fadeInDuration:
                                                              const Duration(
                                                                milliseconds:
                                                                500,
                                                              ),
                                                              fadeOutDuration:
                                                              const Duration(
                                                                milliseconds:
                                                                500,
                                                              ),
                                                              imageUrl:
                                                              completeData
                                                                  .property!
                                                                  .mainImage ??
                                                                  'https://picsum.photos/id/238/200/200.jpg',
                                                              width:
                                                              MediaQuery.sizeOf(
                                                                context,
                                                              ).width *
                                                                  0.9,
                                                              height: 140,
                                                              fit: BoxFit
                                                                  .cover,
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
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                tripBeginDate,
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
                                                                tripEndDate,
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
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding:
                                                                  const EdgeInsets.only(
                                                                    right: 12,
                                                                  ),
                                                                  child: Text(
                                                                    completeData
                                                                        .property!
                                                                        .propertyAddress!,
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
                                                              ),
                                                              Text(
                                                                AppConstants.formatPrice(
                                                                  completeData
                                                                      .tripTotal,
                                                                  locale: 'en_US',
                                                                  symbol: '\$',
                                                                ),
                                                                style: GoogleFonts.urbanist(
                                                                  textStyle: textScheme
                                                                      .titleMedium,
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
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets.only(
                                                                  left: 12,
                                                                ),
                                                                child: Text(
                                                                  'Total ${AppConstants.formatPrice(completeData.tripCost, locale: 'en_US', symbol: '\$')}',
                                                                  style: GoogleFonts.lexendDeca(
                                                                    textStyle:
                                                                    textScheme
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
                                );
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
