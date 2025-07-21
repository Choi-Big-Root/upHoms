import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

import '../../../../core/custom/custom_amenitity_indicator_widget.dart';
import '../../../../core/custom/custom_button_widget.dart';
import '../../../../core/theme/theme_extension.dart';
import '../../../../domain/model/amenity/amenity_model.dart';
import '../../../../domain/model/property/property_model.dart';
import '../../../bloc/property/property_bloc.bloc.dart';
import 'common/custom_property_amenlty.dart';
import 'common/custom_property_app_bar.dart';

class PropertyStep2Widget extends StatefulWidget {
  const PropertyStep2Widget({super.key});

  @override
  State<PropertyStep2Widget> createState() => _PropertyStep2WidgetState();
}

class _PropertyStep2WidgetState extends State<PropertyStep2Widget> {
  final logger = Logger();

  bool _isAC = false;
  bool _isHeater = false;
  bool _isPool = false;
  bool _isDogFriendly = false;
  bool _isWasher = false;
  bool _isDryer = false;
  bool _isWorkOut = false;
  bool _isHip = false;
  bool _isNightLife = false;
  bool _isExtraOutlets = false;
  bool _isEvCharger = false;

  PropertyModel _saveProperty(PropertyModel property) {
    final amenity = AmenityModel(
      ac: _isAC,
      heater: _isHeater,
      pool: _isPool,
      dogFriendly: _isDogFriendly,
      washer: _isWasher,
      dryer: _isDryer,
      workOut: _isWorkOut,
      hip: _isHip,
      nightLife: _isNightLife,
      extraOutlets: _isExtraOutlets,
      evCharger: _isEvCharger,
    );
    final propertyReq = property.copyWith(amenity: amenity);
    return propertyReq;
  }

  void _onPressedNextStep(PropertyModel property) {
    final amenityAddPropertyModel = _saveProperty(property);
    context.read<PropertyBloc>().add(EditingProperty(amenityAddPropertyModel));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;

    return BlocListener<PropertyBloc, PropertyState>(
      listener: (context, state) {
        state.maybeWhen(
          editing: (data) {
            context.push('/property_step3_widget');
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
      child: BlocBuilder<PropertyBloc, PropertyState>(
        builder: (context, state) {
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          16,
                          0,
                          16,
                          0,
                        ),
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
                                        textStyle: textScheme.bodyMedium
                                            ?.copyWith(
                                              color: colorScheme.gray600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const CustomAmenitityIndicatorWidget(
                                    iconData: Icons.pool_rounded,
                                  ),
                                  CustomPropertyAmenlty(
                                    text: 'Pool',
                                    switchVal: _isPool,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _isPool = newValue;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const CustomAmenitityIndicatorWidget(
                                    iconData: Icons.ev_station_rounded,
                                  ),
                                  CustomPropertyAmenlty(
                                    text: 'EV Car Charging',
                                    switchVal: _isEvCharger,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _isEvCharger = newValue;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const CustomAmenitityIndicatorWidget(
                                    iconData: Icons.power_outlined,
                                  ),
                                  CustomPropertyAmenlty(
                                    text: 'Extra Outlets',
                                    switchVal: _isExtraOutlets,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _isExtraOutlets = newValue;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const CustomAmenitityIndicatorWidget(
                                    iconData: Icons.ac_unit_rounded,
                                  ),
                                  CustomPropertyAmenlty(
                                    text: 'Air Conditioning (AC)',
                                    switchVal: _isAC,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _isAC = newValue;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const CustomAmenitityIndicatorWidget(
                                    iconData: Icons.wb_sunny_rounded,
                                  ),
                                  CustomPropertyAmenlty(
                                    text: 'Heating',
                                    switchVal: _isHeater,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _isHeater = newValue;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const CustomAmenitityIndicatorWidget(
                                    iconData:
                                        Icons.local_laundry_service_outlined,
                                  ),
                                  CustomPropertyAmenlty(
                                    text: 'Washer',
                                    switchVal: _isWasher,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _isWasher = newValue;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const CustomAmenitityIndicatorWidget(
                                    iconData:
                                        Icons.local_laundry_service_outlined,
                                  ),
                                  CustomPropertyAmenlty(
                                    text: 'Dryer',
                                    switchVal: _isDryer,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _isDryer = newValue;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const CustomAmenitityIndicatorWidget(
                                    iconData: Icons.pets_rounded,
                                  ),
                                  CustomPropertyAmenlty(
                                    text: 'Pet Friendly',
                                    switchVal: _isDogFriendly,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _isDogFriendly = newValue;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const CustomAmenitityIndicatorWidget(
                                    iconData: Icons.fitness_center_rounded,
                                  ),
                                  CustomPropertyAmenlty(
                                    text: 'Workout Facility',
                                    switchVal: _isWorkOut,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _isWorkOut = newValue;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const CustomAmenitityIndicatorWidget(
                                    iconData: Icons.theater_comedy,
                                  ),
                                  CustomPropertyAmenlty(
                                    text: 'Hip',
                                    switchVal: _isHip,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _isHip = newValue;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const CustomAmenitityIndicatorWidget(
                                    iconData: Icons.nightlife,
                                  ),
                                  CustomPropertyAmenlty(
                                    text: 'Night Life',
                                    switchVal: _isNightLife,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _isNightLife = newValue;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        24,
                        12,
                        24,
                        12,
                      ),
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
                              state.maybeWhen(
                                orElse: () => const SizedBox.shrink(),
                                editing: (property) {
                                  _onPressedNextStep(property);
                                },
                              );
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
        },
      ),
    );
  }
}
