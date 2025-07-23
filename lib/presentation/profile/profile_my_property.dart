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
import '../../domain/model/property/property_model.dart';
import '../bloc/property/property_bloc.bloc.dart';
import '../bloc/user/user_bloc.bloc.dart';

class ProfileMyProperty extends StatefulWidget {
  const ProfileMyProperty({super.key});

  @override
  State<ProfileMyProperty> createState() => _ProfileMyPropertyState();
}

class _ProfileMyPropertyState extends State<ProfileMyProperty>
    with TickerProviderStateMixin {
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
            context.go('/profile');
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: colorScheme.primaryText,
            size: 25,
          ),
        ),
        title: Text(
          'My Properties',
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
                BlocBuilder<UserBloc, UserState>(
                  buildWhen: (previous, current) => current is Success,
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      success: (user) {
                        return BlocBuilder<PropertyBloc, PropertyState>(
                          buildWhen: (previous, current) =>
                              current is PropertiesLoaded,
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () => const SizedBox.shrink(),
                              propertiesLoaded: (properties) {
                                List<PropertyModel> propertiesWithUser =
                                    properties
                                        .where(
                                          (property) =>
                                              property.user!.uid == user.uid,
                                        )
                                        .toList();
                                List<PropertyModel> propertiesIsLive =
                                    propertiesWithUser
                                        .where(
                                          (property) => property.isLive == true,
                                        )
                                        .toList();
                                List<PropertyModel> propertiesUnIsLive =
                                    propertiesWithUser
                                        .where(
                                          (property) =>
                                              property.isLive == false,
                                        )
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
                                            itemCount: propertiesIsLive.length,
                                            // 데이터로 수정
                                            itemBuilder: (context, index) {
                                              final property =
                                                  propertiesIsLive[index];
                                              final DateFormat
                                              desiredFormatter = DateFormat(
                                                'yyyy-MM-dd',
                                              );
                                              DateTime lastUpdatedTime =
                                                  DateTime.parse(
                                                    property.lastUpdated!,
                                                  );
                                              String lastUpdated =
                                                  desiredFormatter.format(
                                                    lastUpdatedTime,
                                                  );

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
                                                      context.push(
                                                        '/trip_details?kind=profile_property&propertyId=${property.propertyId}&mode=edit',
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
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
                                                              property.mainImage !=
                                                                      null &&
                                                                  property
                                                                      .mainImage!
                                                                      .startsWith(
                                                                        'data:image',
                                                                      )
                                                              ? Image.memory(
                                                                  base64Decode(
                                                                    property
                                                                        .mainImage!
                                                                        .split(
                                                                          ',',
                                                                        )
                                                                        .last,
                                                                  ),
                                                                  width: double
                                                                      .infinity,
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
                                                                      property
                                                                          .mainImage ??
                                                                      'https://picsum.photos/id/238/200/200.jpg',
                                                                  width: double
                                                                      .infinity,
                                                                  height: 140,
                                                                  fit: BoxFit
                                                                      .cover,
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
                                                                property
                                                                    .propertyName!,
                                                                style: GoogleFonts.urbanist(
                                                                  textStyle:
                                                                      textScheme
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
                                                                        right:
                                                                            12,
                                                                      ),
                                                                  child: Text(
                                                                    property
                                                                        .propertyAddress!,
                                                                    style: GoogleFonts.lexendDeca(
                                                                      textStyle: textScheme
                                                                          .bodySmall
                                                                          ?.copyWith(
                                                                            color:
                                                                                colorScheme.grayIcon,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                AppConstants.formatPrice(
                                                                  property
                                                                      .price,
                                                                  locale:
                                                                      'en_US',
                                                                  symbol: '\$ ',
                                                                ),
                                                                style: GoogleFonts.urbanist(
                                                                  textStyle:
                                                                      textScheme
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
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  'Last Updated : $lastUpdated',
                                                                  style: GoogleFonts.lexendDeca(
                                                                    textStyle:
                                                                        textScheme
                                                                            .bodyMedium,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets.only(
                                                                      left: 12,
                                                                    ),
                                                                child: Text(
                                                                  'Price Per Night',
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
                                            itemCount:
                                                propertiesUnIsLive.length,
                                            // 데이터로 수정
                                            itemBuilder: (context, index) {
                                              final property =
                                                  propertiesUnIsLive[index];
                                              final DateFormat
                                              desiredFormatter = DateFormat(
                                                'yyyy-MM-dd',
                                              );
                                              DateTime lastUpdatedTime =
                                                  DateTime.parse(
                                                    property.lastUpdated!,
                                                  );
                                              String lastUpdated =
                                                  desiredFormatter.format(
                                                    lastUpdatedTime,
                                                  );
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
                                                      context.push(
                                                        '/trip_details?kind=profile_property&propertyId=${property.propertyId}&mode=edit',
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
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
                                                              property.mainImage !=
                                                                      null &&
                                                                  property
                                                                      .mainImage!
                                                                      .startsWith(
                                                                        'data:image',
                                                                      )
                                                              ? Image.memory(
                                                                  base64Decode(
                                                                    property
                                                                        .mainImage!
                                                                        .split(
                                                                          ',',
                                                                        )
                                                                        .last,
                                                                  ),
                                                                  width: double
                                                                      .infinity,
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
                                                                      property
                                                                          .mainImage ??
                                                                      'https://picsum.photos/id/238/200/200.jpg',
                                                                  width: double
                                                                      .infinity,
                                                                  height: 140,
                                                                  fit: BoxFit
                                                                      .cover,
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
                                                              Expanded(
                                                                child: Text(
                                                                  property
                                                                      .propertyName!,
                                                                  style: GoogleFonts.urbanist(
                                                                    textStyle:
                                                                        textScheme
                                                                            .headlineSmall,
                                                                  ),
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
                                                                        right:
                                                                            12,
                                                                      ),
                                                                  child: Text(
                                                                    property
                                                                        .propertyAddress!,
                                                                    style: GoogleFonts.lexendDeca(
                                                                      textStyle: textScheme
                                                                          .bodySmall
                                                                          ?.copyWith(
                                                                            color:
                                                                                colorScheme.grayIcon,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                AppConstants.formatPrice(
                                                                  property
                                                                      .price,
                                                                  locale:
                                                                      'en_US',
                                                                  symbol: '\$ ',
                                                                ),
                                                                style: GoogleFonts.urbanist(
                                                                  textStyle:
                                                                      textScheme
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
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                'Last Updated : $lastUpdated',
                                                                style: GoogleFonts.lexendDeca(
                                                                  textStyle:
                                                                      textScheme
                                                                          .bodyMedium,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets.only(
                                                                      left: 12,
                                                                    ),
                                                                child: Text(
                                                                  'Price Per Night',
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
