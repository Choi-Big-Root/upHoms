import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../core/constants.dart';
import '../../core/custom/custom_font_weight.dart';
import '../../core/custom/custom_snack_bar.dart';
import '../../core/theme/theme_extension.dart';
import '../../core/utils/image_viewer_utils.dart';
import '../../domain/model/review/review_model.dart';
import '../../domain/model/trip/trip_model.dart';
import '../bloc/review/review_bloc.bloc.dart';
import '../bloc/trip/trip_bloc.bloc.dart';
import '../common_widgets/review_trip_widget.dart';
import '../cubit/message_cubit.dart';
import '../routes/routes.dart';

class MyTripsPage extends StatefulWidget {
  const MyTripsPage({super.key, required this.userId});

  final String userId;

  @override
  State<MyTripsPage> createState() => _MyTripsPageState();
}

class _MyTripsPageState extends State<MyTripsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<TripBloc>().add(GetTripsWithUser({'userId': widget.userId}));
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
      backgroundColor: colorScheme.dark600,
      appBar: AppBar(
        backgroundColor: colorScheme.dark600,
        automaticallyImplyLeading: false,
        title: Text(
          'My Trips',
          style: GoogleFonts.urbanist(
            textStyle: textScheme.headlineMedium?.copyWith(
              fontWeight: CustomFontWeight.bold,
              color: colorScheme.tertiary,
            ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<MessageCubit, MessageState>(
            listener: (context, state) {
              state.when(
                initial: () {},
                success: (message, onDismissed) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    CustomSnackBar.showTopSnackBar(
                      context,
                      message,
                      isError: false,
                      onDismissed: onDismissed,
                    );
                    context.read<MessageCubit>().clearMessage();
                    context.pop();
                    context.read<TripBloc>().add(GetTripsWithUser({'userId': widget.userId}));
                  });
                },
                error: (message) {},
                none: () {},
              );
            },
          ),
          BlocListener<ReviewBloc, ReviewState>(
            listener: (BuildContext context, ReviewState state) {
              state.maybeWhen(orElse: ()=>const SizedBox.shrink(),
                  addReviewSuccess: (){
                context.read<MessageCubit>().showSuccessMessage(
                  '리뷰 등록 완료!',
                );
              });

            },
          ),
        ],
        child: BlocBuilder<TripBloc, TripState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              getTripsWithUserSuccess: (trips) {
                List<TripModel> upcomingList = trips
                    .where((trip) => trip.upcoming == true)
                    .toList();
                List<TripModel> completeList = trips
                    .where((trip) => trip.complete == true)
                    .toList();

                return SafeArea(
                  top: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: const Alignment(0, 0),
                              child: TabBar(
                                controller: _tabController,
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
                                tabs: [
                                  const Tab(text: 'Upcoming'),
                                  const Tab(text: 'Completed'),
                                ],
                                onTap: (_) {},
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  //Upcoming
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
                                        itemCount: upcomingList.length,
                                        // 데이터로 수정
                                        itemBuilder: (context, index) {
                                          final upcomingData =
                                          upcomingList[index];
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
                                                    color: Color(0x32000000),
                                                    blurRadius: 4,
                                                    offset: Offset(0.0, 2),
                                                  ),
                                                ],
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
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
                                                    '/my_trip_details?tripId=$tripIdText',
                                                  );
                                                },
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                      Colors.transparent,
                                                      focusColor:
                                                      Colors.transparent,
                                                      hoverColor:
                                                      Colors.transparent,
                                                      highlightColor:
                                                      Colors.transparent,
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
                                                        borderRadius:
                                                        const BorderRadius.only(
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
                                                        MainAxisSize.max,
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
                                                        MainAxisSize.max,
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
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.end,
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

                                  //Complete
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: colorScheme.primaryBackground,
                                    ),
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
                                        itemCount: completeList.length,
                                        itemBuilder: (context, index) {
                                          final completeData =
                                          completeList[index];
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
                                                    color: Color(0x32000000),
                                                    blurRadius: 4,
                                                    offset: Offset(0.0, 2),
                                                  ),
                                                ],
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
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
                                                    '/my_trip_details?tripId=$tripIdText',
                                                  );
                                                },
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        InkWell(
                                                          splashColor:
                                                          Colors.transparent,
                                                          focusColor:
                                                          Colors.transparent,
                                                          hoverColor:
                                                          Colors.transparent,
                                                          highlightColor:
                                                          Colors.transparent,
                                                          onTap: () {
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

                                                        /// TODO : 취소된 예약이면 Align 활성화
                                                        completeData.cancelTrip!
                                                            ? Align(
                                                          alignment:
                                                          const AlignmentDirectional(
                                                            0.89,
                                                            -0.76,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsetsDirectional.fromSTEB(
                                                              0,
                                                              12,
                                                              0,
                                                              0,
                                                            ),
                                                            child: Container(
                                                              width: 100,
                                                              height: 36,
                                                              decoration: BoxDecoration(
                                                                color: const Color(
                                                                  0xD8ED7070,
                                                                ),
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                  30,
                                                                ),
                                                              ),
                                                              alignment:
                                                              const AlignmentDirectional(
                                                                0,
                                                                0,
                                                              ),
                                                              //결국엔 center.
                                                              child: Text(
                                                                'Cancelled',
                                                                style: GoogleFonts.urbanist(
                                                                  textStyle: textScheme
                                                                      .bodyMedium
                                                                      ?.copyWith(
                                                                    color:
                                                                    colorScheme.tertiary,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                            : const SizedBox.shrink(),
                                                      ],
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
                                                        MainAxisSize.max,
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
                                                        12,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Text(
                                                            AppConstants.formatPrice(
                                                              completeData
                                                                  .tripCost,
                                                              locale: 'en_US',
                                                              symbol: '\$',
                                                            ),
                                                            style: GoogleFonts.urbanist(
                                                              textStyle: textScheme
                                                                  .titleMedium,
                                                            ),
                                                          ),

                                                          /// TODO : 리뷰를 작성하지 않았다면 해당 Button가 표시되도록
                                                          (!completeData
                                                              .cancelTrip! &&
                                                              !completeData
                                                                  .rated!)
                                                              ? ElevatedButton(
                                                            onPressed: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                true,
                                                                useRootNavigator:
                                                                true,
                                                                backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                                barrierColor:
                                                                const Color(
                                                                  0xB21D2429,
                                                                ),
                                                                context:
                                                                context,
                                                                builder: (context) {
                                                                  return Padding(
                                                                    padding:
                                                                    MediaQuery.viewInsetsOf(
                                                                      context,
                                                                    ),
                                                                    child: SizedBox(
                                                                      height:
                                                                      450,
                                                                      child: ReviewTripWidget(
                                                                        onPressed: (rating, reviewText) {
                                                                          logger.d(rating);
                                                                          logger.d(reviewText);
                                                                          final review =
                                                                          ReviewModel(
                                                                            tripId:
                                                                            completeData.tripId,
                                                                            propertyId: completeData
                                                                                .propertyId,
                                                                            user: completeData.user,
                                                                            rating: rating,
                                                                            ratingDescription:
                                                                            reviewText,
                                                                          );
                                                                          context
                                                                              .read<ReviewBloc>()
                                                                              .add(
                                                                            AddReview(review),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                              WidgetStateProperty.all(
                                                                colorScheme
                                                                    .primary,
                                                              ),
                                                              elevation:
                                                              WidgetStateProperty.all(
                                                                2.0,
                                                              ),
                                                              side: WidgetStateProperty.all(
                                                                const BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width:
                                                                  1.0,
                                                                ),
                                                              ),
                                                              minimumSize:
                                                              WidgetStateProperty.all(
                                                                const Size(
                                                                  130,
                                                                  44,
                                                                ),
                                                              ),
                                                              shape: WidgetStateProperty.all(
                                                                RoundedRectangleBorder(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                    30,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            child: Text(
                                                              'Rate Trip',
                                                              style: GoogleFonts.urbanist(
                                                                textStyle: textScheme
                                                                    .titleSmall
                                                                    ?.copyWith(
                                                                  color:
                                                                  Colors.white,
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                              : const SizedBox.shrink(),
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
              },
            );
          },
        ),
      ),
    );
  }
}
