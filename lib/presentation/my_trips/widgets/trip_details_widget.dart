import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/custom/custom_font_weight.dart';
import '../../../core/theme/theme_extension.dart';
import '../../../core/utils/image_viewer_utils.dart';
import '../../common_widgets/review_trip_widget.dart';
import '../../common_widgets/total_widget.dart';
import 'cancel_trip_widget.dart';

class TripDetailsWidget extends StatefulWidget {
  const TripDetailsWidget({super.key});

  @override
  State<TripDetailsWidget> createState() => _TripDetailsWidgetState();
}

class _TripDetailsWidgetState extends State<TripDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;

    return Scaffold(
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 4, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '[MMMEd]',
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
                          '[MMMEd]',
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
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '[propertyNeighborhood]',
                          style: GoogleFonts.urbanist(
                            textStyle: textScheme.headlineMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
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
                              'https://picsum.photos/id/338/500/500.jpg',
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://picsum.photos/id/338/200/200.jpg',
                              fadeOutDuration: const Duration(
                                milliseconds: 500,
                              ),
                              fadeInDuration: const Duration(milliseconds: 500),
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '[propertyName]',
                          style: GoogleFonts.urbanist(
                            textStyle: textScheme.headlineSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        context.push('/property_details');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '[propertyAddress]',
                            style: GoogleFonts.lexendDeca(
                              textStyle: textScheme.bodySmall?.copyWith(
                                fontWeight: CustomFontWeight.normal,
                                fontSize: 12,
                                color: const Color(0xFF8B97A2),
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                                textStyle: textScheme.bodySmall?.copyWith(
                                  fontWeight: CustomFontWeight.bold,
                                  fontSize: 12,
                                  color: colorScheme.gray600,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Base Price',
                              style: GoogleFonts.lexendDeca(
                                textStyle: textScheme.bodySmall?.copyWith(
                                  fontWeight: CustomFontWeight.normal,
                                  color: const Color(0xFF8B97A2),
                                ),
                              ),
                            ),
                            Text(
                              '[\$1,234]',
                              style: GoogleFonts.urbanist(
                                textStyle: textScheme.titleSmall,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Taxes',
                              style: GoogleFonts.lexendDeca(
                                textStyle: textScheme.bodySmall?.copyWith(
                                  fontWeight: CustomFontWeight.normal,
                                  color: const Color(0xFF8B97A2),
                                ),
                              ),
                            ),
                            Text(
                              '\$24.20',
                              style: GoogleFonts.urbanist(
                                textStyle: textScheme.titleSmall,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cleaning Fee',
                              style: GoogleFonts.lexendDeca(
                                textStyle: textScheme.bodySmall?.copyWith(
                                  fontWeight: CustomFontWeight.normal,
                                  color: const Color(0xFF8B97A2),
                                ),
                              ),
                            ),
                            Text(
                              '\$40.00',
                              style: GoogleFonts.urbanist(
                                textStyle: textScheme.titleSmall,
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
                          24,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Total',
                                  style: GoogleFonts.lexendDeca(
                                    textStyle: textScheme.headlineSmall
                                        ?.copyWith(
                                          fontWeight: CustomFontWeight.normal,
                                          color: const Color(0xFF8B97A2),
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
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: IconButton(
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: const Color(0xB3000000),
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
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
                              '\$230.20',
                              style: GoogleFonts.urbanist(
                                textStyle: textScheme.displaySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Your trip has been completed!',
                            style: GoogleFonts.urbanist(
                              textStyle: textScheme.titleMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              0,
                              12,
                              0,
                              24,
                            ),
                            child: ElevatedButton(
                              onPressed: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: const Color(0xB21D2429),
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const SizedBox(
                                        height: 450,
                                        child: ReviewTripWidget(),
                                      ),
                                    );
                                  },
                                );
                                if(!context.mounted) return;
                                //context.pop();
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(160, 50),
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
                                'Review Trip',
                                style: GoogleFonts.lexendDeca(
                                  textStyle: textScheme.titleSmall?.copyWith(
                                    fontWeight: CustomFontWeight.medium,
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
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 40),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0,
                          4,
                          0,
                          0,
                        ),
                        child: Text(
                          'Host Info',
                          style: GoogleFonts.lexendDeca(
                            textStyle: textScheme.bodySmall?.copyWith(
                              fontWeight: CustomFontWeight.normal,
                              color: const Color(0xFF8B97A2),
                            ),
                          ),
                        ),
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
                            Container(
                              width: 40,
                              height: 40,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://picsum.photos/id/238/200/200.jpg',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                8,
                                0,
                                12,
                                0,
                              ),
                              child: Text(
                                '[display_name]',
                                style: GoogleFonts.urbanist(
                                  textStyle: textScheme.titleSmall?.copyWith(
                                    color: colorScheme.secondaryBackground,
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
      ),
    );
  }
}
