import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants.dart';
import '../../core/custom/custom_font_weight.dart';
import '../../core/theme/theme_extension.dart';
import '../../core/utils/image_viewer_utils.dart';
import '../bloc/property/property_bloc.bloc.dart';
import '../bloc/review/review_bloc.bloc.dart';
import '../common_widgets/rating_bar_widget.dart';

class TripDetailsWidget extends StatefulWidget {
  const TripDetailsWidget({
    super.key,
    required this.propertyId,
    required this.kind,
    this.searchText,
  });

  final Map<String, dynamic> propertyId;
  final String? kind;
  final String? searchText;

  @override
  State<TripDetailsWidget> createState() => _TripDetailsWidgetState();
}

class _TripDetailsWidgetState extends State<TripDetailsWidget>
    with TickerProviderStateMixin {
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    context.read<PropertyBloc>().add(LoadProperty(widget.propertyId));
    context.read<ReviewBloc>().add(GetReviews(widget.propertyId));
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (result, data) {
        if (widget.kind == 'home') {
          context.read<PropertyBloc>().add(const LoadProperties());
        } else if (widget.kind == 'search') {
          context.read<PropertyBloc>().add(
            LoadSearchProperties({'searchText': widget.searchText}),
          );
        }
      },
      child: Scaffold(
        backgroundColor: colorScheme.secondaryBackground,
        body: BlocBuilder<PropertyBloc, PropertyState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              propertyLoaded: (property) {
                final Map<String, dynamic> amenityDataAsMap = property.amenity!
                    .toJson();
                final List<String> orderedAmenityKeys = AppConstants
                    .amenityIconMap
                    .keys
                    .toList();
                final List<String> enabledAndOrderedAmenities =
                    orderedAmenityKeys.where((key) {
                      final bool? isEnabled = amenityDataAsMap[key] as bool?;
                      return isEnabled == true;
                    }).toList();
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
                                0,
                                44,
                                0,
                                0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.9,
                                    height: 320,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFDBE2E7),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: const AlignmentDirectional(
                                            0,
                                            0,
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () {
                                              print('test');
                                              showFullScreenImage(
                                                context,
                                                property.mainImage ?? '',
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              child:
                                                  property.mainImage != null &&
                                                      property.mainImage!
                                                          .startsWith(
                                                            'data:image',
                                                          )
                                                  ? Image.memory(
                                                      base64Decode(
                                                        property.mainImage!
                                                            .split(',')
                                                            .last,
                                                      ),
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
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
                                                          property.mainImage ??
                                                          'https://picsum.photos/id/238/200/200.jpg',
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                    child: SizedBox(
                                                      width: 46,
                                                      height: 46,
                                                      child: Card(
                                                        clipBehavior: Clip
                                                            .antiAliasWithSaveLayer,
                                                        color: const Color(
                                                          0x3A000000,
                                                        ),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8,
                                                              ),
                                                        ),
                                                        child: IconButton(
                                                          onPressed: () {
                                                            context.pop();
                                                          },
                                                          icon: const Icon(
                                                            Icons
                                                                .arrow_back_rounded,
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
                              padding: const EdgeInsetsGeometry.fromSTEB(
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
                                      property.propertyName ?? '',
                                      style: GoogleFonts.urbanist(
                                        textStyle: textScheme.displaySmall,
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
                                0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      property.propertyNeighborhood ?? '',
                                      style: GoogleFonts.lexendDeca(
                                        textStyle: textScheme.bodySmall
                                            ?.copyWith(
                                              color: const Color(0xFF8B97A2),
                                              fontWeight:
                                                  CustomFontWeight.normal,
                                              fontSize: 12,
                                            ),
                                      ),
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            8,
                                            0,
                                            0,
                                            0,
                                          ),
                                      child: Text(
                                        property.ratingSummary.toString() ?? '',
                                        style: GoogleFonts.lexendDeca(
                                          textStyle: textScheme.bodySmall
                                              ?.copyWith(
                                                fontWeight:
                                                    CustomFontWeight.normal,
                                                fontSize: 12,
                                                color: const Color(0xFF8B97A2),
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
                                        'Reviews',
                                        style: GoogleFonts.lexendDeca(
                                          textStyle: textScheme.bodySmall
                                              ?.copyWith(
                                                fontWeight:
                                                    CustomFontWeight.normal,
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                24,
                                4,
                                24,
                                0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            0,
                                            0,
                                            0,
                                            24,
                                          ),
                                      child: Text(
                                        property.propertyDescription ?? '',
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
                                  ),
                                ],
                              ),
                            ),
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                24,
                                12,
                                0,
                                0,
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 44,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        enabledAndOrderedAmenities.length,
                                    itemBuilder: (context, index) {
                                      final String amenityKey =
                                          enabledAndOrderedAmenities[index];
                                      final IconData? amenityIcon = AppConstants
                                          .amenityIconMap[amenityKey];

                                      // 만약 아이콘 매핑이 없으면 빌드하지 않습니다. (여기서는 null이 오지 않는다고 가정)
                                      if (amenityIcon == null) {
                                        return const SizedBox.shrink();
                                      }

                                      return Padding(
                                        padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                              0,
                                              0,
                                              8,
                                              0,
                                            ),
                                        child: Container(
                                          width: 44,
                                          height: 44,
                                          decoration: BoxDecoration(
                                            color:
                                                colorScheme.secondaryBackground,
                                            border: Border.all(
                                              color: colorScheme.lineGray,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              22,
                                            ),
                                          ),
                                          child: Icon(
                                            amenityIcon,
                                            color: colorScheme.grayIcon,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                0,
                                16,
                                0,
                                0,
                              ),
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
                                        padding:
                                            const EdgeInsetsDirectional.fromSTEB(
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
                                      BlocBuilder<ReviewBloc, ReviewState>(
                                        builder: (context, state) {
                                          return state.maybeWhen(
                                            orElse: () =>
                                                const SizedBox.shrink(),
                                            loadedReviews: (reviews) {
                                              return Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional.fromSTEB(
                                                        0,
                                                        8,
                                                        0,
                                                        0,
                                                      ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 200,
                                                    color: colorScheme
                                                        .primaryBackground,
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
                                                            controller:
                                                                _pageController,
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount:
                                                                reviews.length,
                                                            itemBuilder:
                                                                (
                                                                  context,
                                                                  pageViewIndex,
                                                                ) {
                                                                  final review =
                                                                      reviews[pageViewIndex];
                                                                  return Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                          12,
                                                                        ),
                                                                    child: Container(
                                                                      width:
                                                                          100,
                                                                      decoration: BoxDecoration(
                                                                        color: colorScheme
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          const BoxShadow(
                                                                            blurRadius:
                                                                                5,
                                                                            color: Color(
                                                                              0x24090F13,
                                                                            ),
                                                                            offset: Offset(
                                                                              0.0,
                                                                              2,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                              16,
                                                                            ),
                                                                      ),
                                                                      child: Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(
                                                                              12,
                                                                            ),
                                                                        child: Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      review.user!.displayName ??
                                                                                          '',
                                                                                      style: GoogleFonts.urbanist(
                                                                                        textStyle: textScheme.headlineSmall,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                        0,
                                                                                        4,
                                                                                        0,
                                                                                        0,
                                                                                      ),
                                                                                      child: RatingBarWidget(
                                                                                        initalRating:
                                                                                            review.rating ??
                                                                                            0.0,
                                                                                        starSize: 25,
                                                                                        activeColor: const Color(
                                                                                          0xFFFFA130,
                                                                                        ),
                                                                                        inactiveColor: const Color(
                                                                                          0xFFD6D9DB,
                                                                                        ),
                                                                                        isTouch: false,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                review.user!.photoUrl!.isEmpty
                                                                                    ? const SizedBox.shrink()
                                                                                    : Container(
                                                                                        width: 50,
                                                                                        height: 50,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: const BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child:
                                                                                            review.user!.photoUrl!.startsWith(
                                                                                              'data:image',
                                                                                            )
                                                                                            ? Image.memory(
                                                                                                base64Decode(
                                                                                                  review.user!.photoUrl!
                                                                                                      .split(
                                                                                                        ',',
                                                                                                      )
                                                                                                      .last,
                                                                                                ),
                                                                                                fit: BoxFit.cover,
                                                                                              )
                                                                                            : CachedNetworkImage(
                                                                                                imageUrl:
                                                                                                    review.user!.photoUrl ??
                                                                                                    'https://picsum.photos/id/238/200/200.jpg',
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                      ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                8,
                                                                                0,
                                                                                0,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                      0,
                                                                                      0,
                                                                                      0,
                                                                                      24,
                                                                                    ),
                                                                                    child: Text(
                                                                                      review.ratingDescription ??
                                                                                          '',
                                                                                      style: GoogleFonts.lexendDeca(
                                                                                        textStyle: textScheme.bodySmall?.copyWith(
                                                                                          fontWeight: CustomFontWeight.normal,
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
                                                        reviews.isNotEmpty
                                                            ? Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                      0.0,
                                                                      1.0,
                                                                    ),
                                                                // 하단 중앙에 위치
                                                                child: SmoothPageIndicator(
                                                                  controller:
                                                                      _pageController,
                                                                  // PageController와 연동
                                                                  count: reviews
                                                                      .length,
                                                                  // 총 페이지 수
                                                                  axisDirection:
                                                                      Axis.horizontal,
                                                                  onDotClicked: (index) {
                                                                    _pageController.animateToPage(
                                                                      index,
                                                                      duration: const Duration(
                                                                        milliseconds:
                                                                            500,
                                                                      ),
                                                                      curve: Curves
                                                                          .ease,
                                                                    );
                                                                  },
                                                                  effect: ExpandingDotsEffect(
                                                                    // 여러 가지 효과 중 선택
                                                                    expansionFactor:
                                                                        3,
                                                                    // 확장 비율
                                                                    dotHeight:
                                                                        8,
                                                                    dotWidth: 8,
                                                                    dotColor:
                                                                        colorScheme
                                                                            .grayIcon,
                                                                    // 비활성 점 색상
                                                                    activeDotColor:
                                                                        colorScheme
                                                                            .dark600,
                                                                    // 활성 점 색상 (원하는 색상으로 변경)
                                                                    spacing:
                                                                        10.0, // 점들 간의 간격
                                                                  ),
                                                                ),
                                                              )
                                                            : const SizedBox.shrink(),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          16,
                          16,
                          16,
                          40,
                        ),
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
                                      AppConstants.formatPrice(
                                        property.price!,
                                        locale: 'en_US',
                                        symbol: '\$',
                                      ),
                                      style: GoogleFonts.urbanist(
                                        textStyle: textScheme.headlineSmall
                                            ?.copyWith(
                                              color: colorScheme
                                                  .secondaryBackground,
                                            ),
                                      ),
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
                                        '+ taxes/fees',
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
                                    'per night', //1박당.
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
                );
              },
            );
          },
        ),
      ),
    );
  }
}
