import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/custom/custom_amenitity_indicator_widget.dart';
import '../../../../core/custom/custom_button_widget.dart';
import '../../../../core/theme/theme_extension.dart';
import 'common/custom_property_amenlty.dart';
import 'common/custom_property_app_bar.dart';

class PropertyStep2Widget extends StatefulWidget {
  const PropertyStep2Widget({super.key});

  @override
  State<PropertyStep2Widget> createState() => _PropertyStep2WidgetState();
}

class _PropertyStep2WidgetState extends State<PropertyStep2Widget> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.secondaryBackground,
      appBar: const CustomPropertyAppBar(),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            0,
                            0,
                            0,
                            12,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'CHOOSE YOUR AMENITIES',
                                style: GoogleFonts.urbanist(
                                  textStyle: textScheme.bodyMedium?.copyWith(
                                    color: colorScheme.gray600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomAmenitityIndicatorWidget(iconData: Icons.pool_rounded),
                            CustomPropertyAmenlty(text: 'Pool', switchVal: false),
                          ],
                        ),
                        const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomAmenitityIndicatorWidget(iconData: Icons.ev_station_rounded),
                            CustomPropertyAmenlty(text: 'EV Car Charging', switchVal: false),
                          ],
                        ),
                        const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomAmenitityIndicatorWidget(iconData: Icons.power_outlined),
                            CustomPropertyAmenlty(text: 'Extra Outlets', switchVal: false),
                          ],
                        ),
                        const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomAmenitityIndicatorWidget(iconData: Icons.ac_unit_rounded),
                            CustomPropertyAmenlty(text: 'Air Conditioning (AC)', switchVal: false),
                          ],
                        ),
                        const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomAmenitityIndicatorWidget(iconData: Icons.wb_sunny_rounded),
                            CustomPropertyAmenlty(text: 'Heating', switchVal: false),
                          ],
                        ),
                        const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomAmenitityIndicatorWidget(iconData: Icons.local_laundry_service_outlined),
                            CustomPropertyAmenlty(text: 'Washer', switchVal: false),
                          ],
                        ),
                        const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomAmenitityIndicatorWidget(iconData: Icons.local_laundry_service_outlined),
                            CustomPropertyAmenlty(text: 'Dryer', switchVal: false),
                          ],
                        ),
                        const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomAmenitityIndicatorWidget(iconData: Icons.pets_rounded),
                            CustomPropertyAmenlty(text: 'Pet Friendly', switchVal: false),
                          ],
                        ),
                        const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomAmenitityIndicatorWidget(iconData: Icons.fitness_center_rounded),
                            CustomPropertyAmenlty(text: 'Workout Facility', switchVal: false),
                          ],
                        ),
                        const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomAmenitityIndicatorWidget(iconData: Icons.theater_comedy),
                            CustomPropertyAmenlty(text: 'Hip', switchVal: false),
                          ],
                        ),
                        const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomAmenitityIndicatorWidget(iconData: Icons.nightlife),
                            CustomPropertyAmenlty(text: 'Night Life', switchVal: false),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'STEP',
                          style: GoogleFonts.urbanist(
                            textStyle: textScheme.bodyMedium,
                          ),
                        ),
                        Text(
                          '2/3',
                          style: GoogleFonts.urbanist(
                            textStyle: textScheme.headlineMedium,
                          ),
                        ),
                      ],
                    ),
                    CustomButtonWidget(
                      color: colorScheme.primary,
                      onPressed: () {
                        context.push('/property_step3_widget');
                      },
                      elevation: 2.0,
                      circular: 60,
                      size: const Size(120, 50),
                      text: 'NEXT',
                      style: GoogleFonts.urbanist(
                        textStyle: textScheme.titleSmall?.copyWith(
                          color: Colors.white,
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
  }
}
