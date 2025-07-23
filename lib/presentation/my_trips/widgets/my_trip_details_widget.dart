import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../core/constants.dart';
import '../../../core/custom/custom_font_weight.dart';
import '../../../core/custom/custom_snack_bar.dart';
import '../../../core/theme/theme_extension.dart';
import '../../../core/utils/image_viewer_utils.dart';
import '../../../domain/model/review/review_model.dart';
import '../../bloc/review/review_bloc.bloc.dart';
import '../../bloc/trip/trip_bloc.bloc.dart';
import '../../common_widgets/review_trip_widget.dart';
import '../../common_widgets/total_widget.dart';
import '../../cubit/message_cubit.dart';
import '../../routes/routes.dart';
import 'cancel_trip_widget.dart';

class MyTripDetailsWidget extends StatefulWidget {
  const MyTripDetailsWidget({super.key, required this.tripId});

  final Map<String, dynamic> tripId;

  @override
  State<MyTripDetailsWidget> createState() => _MyTripDetailsWidgetState();
}

class _MyTripDetailsWidgetState extends State<MyTripDetailsWidget> {
  DateTime _stripTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  @override
  void initState() {
    super.initState();
    context.read<TripBloc>().add(GetTrip(widget.tripId));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;
    return MultiBlocListener(
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
                });
              },
              error: (message) {},
              none: () {},
            );
          },
        ),
        BlocListener<ReviewBloc, ReviewState>(
          listener: (context, state) {
            state.maybeWhen(
             orElse: () => const SizedBox.shrink(),
              addReviewSuccess: (){
               logger.d('오냐?');
               context.read<MessageCubit>().showSuccessMessage(
                 '리뷰 등록 완료!',
               );
               context.go('/my_trips');
              }
            );
          },
        ),
      ],
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (result, data) {
          logger.d('test');
          context.go('/my_trips');
        },
        child: Scaffold(
          backgroundColor: colorScheme.secondaryBackground,
          appBar: AppBar(
            backgroundColor: colorScheme.secondaryBackground,
            automaticallyImplyLeading: false,
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent, width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                onPressed: () {
                  context.go('/my_trips');
                  logger.d('test2');
                  //context.pop();
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            title: Text(
              'Trip Details',
              style: GoogleFonts.urbanist(
                textStyle: textScheme.titleMedium?.copyWith(
                  color: colorScheme.secondaryText,
                ),
              ),
            ),
            actions: [
              Visibility(
                //visible: , //예약이 완료됬을 경우에만 [true/false] 분리.
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        barrierColor: const Color(0xB314181B),
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: const SizedBox(
                              height: 450,
                              child: CancelTripWidget(tripDetails: true),
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.more_vert_outlined,
                      color: colorScheme.secondaryText,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0,
          ),
          body: BlocBuilder<TripBloc, TripState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                getTripSuccess: (trip) {
                  final DateFormat desiredFormatter = DateFormat('yyyy-MM-dd');
                  DateTime dateTimeBegin = DateTime.parse(trip.tripBeginDate!);
                  DateTime dateTimeEnd = DateTime.parse(trip.tripEndDate!);
                  String tripBeginDate = desiredFormatter.format(dateTimeBegin);
                  String tripEndDate = desiredFormatter.format(dateTimeEnd);
                  final taxes = trip.tripTotal! * trip.property!.taxRate! / 100;

                  logger.d(taxes);
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  24,
                                  4,
                                  24,
                                  0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Dates of trip',
                                      style: GoogleFonts.urbanist(
                                        textStyle: textScheme.bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  24,
                                  4,
                                  16,
                                  0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      tripBeginDate,
                                      style: GoogleFonts.urbanist(
                                        textStyle: textScheme.displaySmall,
                                      ),
                                    ),
                                    Text(
                                      ' - ',
                                      style: GoogleFonts.urbanist(
                                        textStyle: textScheme.displaySmall,
                                      ),
                                    ),
                                    Text(
                                      tripEndDate,
                                      style: GoogleFonts.urbanist(
                                        textStyle: textScheme.displaySmall,
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
                                    Text(
                                      'Destination',
                                      style: GoogleFonts.urbanist(
                                        textStyle: textScheme.bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  24,
                                  8,
                                  24,
                                  0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        trip.property!.propertyNeighborhood
                                            .toString(),
                                        style: GoogleFonts.urbanist(
                                          textStyle: textScheme.headlineMedium,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  0,
                                  16,
                                  0,
                                  0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        // 이미지 선택시 이미지 전체화면 표시
                                        showFullScreenImage(
                                          context,
                                          trip.property!.mainImage ?? '',
                                        );
                                      },
                                      child:
                                          trip.property!.mainImage != null &&
                                              trip.property!.mainImage!
                                                  .startsWith('data:image')
                                          ? Image.memory(
                                              base64Decode(
                                                trip.property!.mainImage!
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
                                              fadeInDuration: const Duration(
                                                milliseconds: 500,
                                              ),
                                              fadeOutDuration: const Duration(
                                                milliseconds: 500,
                                              ),
                                              imageUrl:
                                                  trip.property!.mainImage ??
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  24,
                                  8,
                                  24,
                                  0,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      trip.property!.propertyName.toString(),
                                      style: GoogleFonts.urbanist(
                                        textStyle: textScheme.headlineSmall,
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
                                  0,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    String propertyIdText = Uri.encodeComponent(
                                      trip.property!.propertyId.toString(),
                                    );
                                    String tripIdText = Uri.encodeComponent(
                                      trip.tripId.toString(),
                                    );
                                    context.push(
                                      '/trip_details?propertyId=$propertyIdText&tripId=$tripIdText&kind=trip_detail',
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          trip.property!.propertyDescription
                                              .toString(),
                                          style: GoogleFonts.lexendDeca(
                                            textStyle: textScheme.bodySmall
                                                ?.copyWith(
                                                  fontWeight:
                                                      CustomFontWeight.normal,
                                                  fontSize: 12,
                                                  color: const Color(
                                                    0xFF8B97A2,
                                                  ),
                                                ),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: colorScheme.grayIcon,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          24,
                                          16,
                                          24,
                                          4,
                                        ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Price Breakdown',
                                          style: GoogleFonts.lexendDeca(
                                            textStyle: textScheme.bodySmall
                                                ?.copyWith(
                                                  fontWeight:
                                                      CustomFontWeight.bold,
                                                  fontSize: 12,
                                                  color: colorScheme.gray600,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          24,
                                          4,
                                          24,
                                          0,
                                        ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Base Price',
                                          style: GoogleFonts.lexendDeca(
                                            textStyle: textScheme.bodySmall
                                                ?.copyWith(
                                                  fontWeight:
                                                      CustomFontWeight.normal,
                                                  color: const Color(
                                                    0xFF8B97A2,
                                                  ),
                                                ),
                                          ),
                                        ),
                                        Text(
                                          AppConstants.formatPrice(
                                            trip.tripTotal,
                                            locale: 'en_US',
                                            symbol: '\$',
                                          ),
                                          style: GoogleFonts.urbanist(
                                            textStyle: textScheme.titleSmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          24,
                                          4,
                                          24,
                                          0,
                                        ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Taxes',
                                          style: GoogleFonts.lexendDeca(
                                            textStyle: textScheme.bodySmall
                                                ?.copyWith(
                                                  fontWeight:
                                                      CustomFontWeight.normal,
                                                  color: const Color(
                                                    0xFF8B97A2,
                                                  ),
                                                ),
                                          ),
                                        ),
                                        Text(
                                          AppConstants.formatPrice(
                                            taxes,
                                            locale: 'en_US',
                                            symbol: '\$',
                                          ),
                                          style: GoogleFonts.urbanist(
                                            textStyle: textScheme.titleSmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          24,
                                          4,
                                          24,
                                          0,
                                        ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Cleaning Fee',
                                          style: GoogleFonts.lexendDeca(
                                            textStyle: textScheme.bodySmall
                                                ?.copyWith(
                                                  fontWeight:
                                                      CustomFontWeight.normal,
                                                  color: const Color(
                                                    0xFF8B97A2,
                                                  ),
                                                ),
                                          ),
                                        ),
                                        Text(
                                          AppConstants.formatPrice(
                                            trip.property!.cleaningFee,
                                            locale: 'en_US',
                                            symbol: '\$',
                                          ),
                                          style: GoogleFonts.urbanist(
                                            textStyle: textScheme.titleSmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          24,
                                          4,
                                          24,
                                          24,
                                        ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Total',
                                              style: GoogleFonts.lexendDeca(
                                                textStyle: textScheme
                                                    .headlineSmall
                                                    ?.copyWith(
                                                      fontWeight:
                                                          CustomFontWeight
                                                              .normal,
                                                      color: const Color(
                                                        0xFF8B97A2,
                                                      ),
                                                    ),
                                              ),
                                            ),
                                            Container(
                                              width: 48,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: IconButton(
                                                onPressed: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    barrierColor: const Color(
                                                      0xB3000000,
                                                    ),
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding:
                                                            MediaQuery.viewInsetsOf(
                                                              context,
                                                            ),
                                                        child: const SizedBox(
                                                          height: 280,
                                                          child: TotalWidget(),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.info_outline,
                                                  size: 18,
                                                  color: colorScheme.grayIcon,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          AppConstants.formatPrice(
                                            trip.tripCost,
                                            locale: 'en_US',
                                            symbol: '\$',
                                          ),
                                          style: GoogleFonts.urbanist(
                                            textStyle: textScheme.displaySmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Your trip has been completed!',
                                        style: GoogleFonts.urbanist(
                                          textStyle: textScheme.titleMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                              0,
                                              12,
                                              0,
                                              24,
                                            ),
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: const Color(
                                                0xB21D2429,
                                              ),
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                        context,
                                                      ),
                                                  child: SizedBox(
                                                    height: 450,
                                                    child: ReviewTripWidget(
                                                      onPressed: (rating, reviewText) {
                                                        logger.d(rating);
                                                        logger.d(reviewText);
                                                        final review =
                                                            ReviewModel(
                                                              tripId:
                                                                  trip.tripId,
                                                              propertyId: trip
                                                                  .propertyId,
                                                              user: trip.user,
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
                                            if (!context.mounted) return;
                                            //context.pop();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            fixedSize: const Size(160, 50),
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                  0,
                                                  0,
                                                  0,
                                                  0,
                                                ),
                                            backgroundColor:
                                                colorScheme.primary,
                                            elevation: 3,
                                            side: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                          ),
                                          child: Text(
                                            'Review Trip',
                                            style: GoogleFonts.lexendDeca(
                                              textStyle: textScheme.titleSmall
                                                  ?.copyWith(
                                                    fontWeight:
                                                        CustomFontWeight.medium,
                                                    color: Colors.white,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
                              color: Color(0x55000000),
                              blurRadius: 4,
                              offset: Offset(0.0, 2),
                            ),
                          ],
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            16,
                            16,
                            16,
                            40,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          4,
                                          0,
                                          0,
                                        ),
                                    child: Text(
                                      'Host Info',
                                      style: GoogleFonts.lexendDeca(
                                        textStyle: textScheme.bodySmall
                                            ?.copyWith(
                                              fontWeight:
                                                  CustomFontWeight.normal,
                                              color: const Color(0xFF8B97A2),
                                            ),
                                      ),
                                    ),
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
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        trip.host!.photoUrl!.isNotEmpty
                                            ? Container(
                                                width: 40,
                                                height: 40,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child:
                                                    trip.host!.photoUrl !=
                                                            null &&
                                                        trip.host!.photoUrl!
                                                            .startsWith(
                                                              'data:image',
                                                            )
                                                    ? Image.memory(
                                                        base64Decode(
                                                          trip.host!.photoUrl!
                                                              .split(',')
                                                              .last,
                                                        ),
                                                      )
                                                    : CachedNetworkImage(
                                                        fadeInDuration:
                                                            const Duration(
                                                              milliseconds: 500,
                                                            ),
                                                        fadeOutDuration:
                                                            const Duration(
                                                              milliseconds: 500,
                                                            ),
                                                        imageUrl:
                                                            trip
                                                                .host!
                                                                .photoUrl ??
                                                            'https://picsum.photos/id/238/200/200.jpg',
                                                      ),
                                              )
                                            : const SizedBox.shrink(),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                8,
                                                0,
                                                12,
                                                0,
                                              ),
                                          child: Text(
                                            trip.host!.displayName!,
                                            style: GoogleFonts.urbanist(
                                              textStyle: textScheme.titleSmall
                                                  ?.copyWith(
                                                    color: colorScheme
                                                        .secondaryBackground,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
