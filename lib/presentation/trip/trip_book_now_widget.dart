import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../core/constants.dart';
import '../../core/custom/custom_font_weight.dart';
import '../../core/theme/theme_extension.dart';
import '../../domain/model/property/property_model.dart';
import '../../domain/model/trip/trip_model.dart';
import '../../domain/model/user/user_model.dart';
import '../bloc/property/property_bloc.bloc.dart';
import '../bloc/trip/trip_bloc.bloc.dart';
import '../bloc/user/user_bloc.bloc.dart';
import '../common_widgets/breakfast_selection_grid.dart';
import '../common_widgets/credit_card_form.dart';
import '../common_widgets/total_widget.dart';

class TripBookNowWidget extends StatefulWidget {
  const TripBookNowWidget({
    super.key,
  });

  @override
  State<TripBookNowWidget> createState() => _TripBookNowWidgetState();
}

class _TripBookNowWidgetState extends State<TripBookNowWidget> {
  final logger = Logger();
  DateTime? _selectedDate0;
  DateTime? _selectedDate1;
  final DateFormat _dateFormatter = DateFormat('yyyy-MM-dd');
  int datesCal = 1;
  int _guestCount = 1;

  @override
  void initState() {
    super.initState();
    _selectedDate0 = DateTime.now();
    _selectedDate1 = DateTime.now().add(const Duration(days: 1));
    _calculateDatesCal();
  }

  DateTime _stripTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  void _calculateDatesCal() {
    if (_selectedDate0 != null && _selectedDate1 != null) {
      final DateTime strippedDate0 = _stripTime(_selectedDate0!);
      final DateTime strippedDate1 = _stripTime(_selectedDate1!);

      final Duration difference = strippedDate1.difference(strippedDate0);


      setState(() {
        datesCal = difference.inDays.abs();
      });
    } else {
      setState(() {
        datesCal = 0;
      });
    }
  }
  Future<void> _pickDate(BuildContext context, int key) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: key == 0 ? _selectedDate0 ?? DateTime.now() : _selectedDate1 ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );

    if (picked == null) return;

    setState(() {
      if (key == 0) {
        _selectedDate0 = picked;
        // 시작 날짜 변경 시, 종료 날짜가 시작 날짜와 같거나 이전이면 +1 조정
        if (_selectedDate1 != null && (_selectedDate1!.isBefore(_selectedDate0!) || _selectedDate1!.isAtSameMomentAs(_selectedDate0!))) {
          _selectedDate1 = _selectedDate0!.add(const Duration(days: 1));
        }
      } else if (key == 1) {
        if (_selectedDate0 != null && (picked.isBefore(_selectedDate0!) || picked.isAtSameMomentAs(_selectedDate0!))) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('종료 날짜는 시작 날짜보다 빠르거나 같을 수 없습니다.')),
          );
          return; // 선택 취소
        }
        _selectedDate1 = picked;
      }
      _calculateDatesCal();
    });
  }


  void _increment() {
    setState(() {
      if (_guestCount < 8) _guestCount++;
    });
  }

  void _decrement() {
    setState(() {
      if (_guestCount > 0) _guestCount--;
    });
  }

  void _onPressedBookNow(PropertyModel property,UserModel user) {
    //property
    final DateTime strippedDate0 = _stripTime(_selectedDate0!);
    final DateTime strippedDate1 = _stripTime(_selectedDate1!);
    final nowDate = _stripTime(DateTime.now());
    var upcoming = false;

    final tripTotal = (property.price ?? 0) * datesCal;
    final taxes =   ((property.price ?? 0) * datesCal) * (property.taxRate ?? 0.0) / 100;
    final totalPrice = ((property.price ?? 0) * datesCal) + taxes + (property.cleaningFee ?? 0);

    if(strippedDate0 == nowDate){
      upcoming = true;
    }

    final tripModel = TripModel(
      tripId: -1,
      propertyId: property.propertyId,
      userId: user.uid,
      property: property,
      user: user,
      tripBeginDate: strippedDate0.toString(),
      tripEndDate: strippedDate1.toString(),
      tripCost: totalPrice,
      guests: _guestCount,
      paymentMethod: '',
      tripCreated: nowDate.toString(),
      hostId: property.user!.uid,
      host: property.user!,
      cancelTrip: false,
      cancelReason: '',
      tripTotal: tripTotal,
      upcoming: upcoming,
      complete: false,
      rated: false,
    );
    logger.d(property.user);

    context.read<TripBloc>().add(AddTrip(tripModel));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (result, data) {},
      child: Scaffold(
        backgroundColor: colorScheme.secondaryBackground,
        body: BlocBuilder<PropertyBloc, PropertyState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              propertyLoaded: (property) {
                final taxes = ((property.price ?? 0) * datesCal) * (property.taxRate ?? 0.0) / 100;
                final totalPrice = ((property.price ?? 0) * datesCal) + taxes + (property.cleaningFee ?? 0);
                logger.d(taxes);
                return BlocBuilder<UserBloc, UserState>(
                  builder: (context,state) {
                    return state.maybeWhen(success: (user){
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
                                      20,
                                      50,
                                      20,
                                      0,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Card(
                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                          color: const Color(0x3A000000),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Container(
                                            width: 46,
                                            height: 46,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            child: IconButton(
                                              onPressed: () {
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
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            12,
                                            0,
                                            0,
                                            0,
                                          ),
                                          child: Text(
                                            'Book Now',
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
                                      12,
                                      0,
                                      0,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(16),
                                          child:
                                          property.mainImage != null &&
                                              property.mainImage!.startsWith(
                                                'data:image',
                                              )
                                              ? Image.memory(
                                            base64Decode(
                                              property.mainImage!
                                                  .split(',')
                                                  .last,
                                            ),
                                            width:
                                            MediaQuery.sizeOf(
                                              context,
                                            ).width *
                                                0.9,
                                            height: 120,
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
                                            property.mainImage ??
                                                'https://picsum.photos/id/238/200/200.jpg',
                                            width:
                                            MediaQuery.sizeOf(
                                              context,
                                            ).width *
                                                0.9,
                                            height: 120,
                                            fit: BoxFit.cover,
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
                                      12,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            property.propertyNeighborhood ?? '',
                                            style: GoogleFonts.lexendDeca(
                                              fontWeight: CustomFontWeight.normal,
                                              fontSize: 12,
                                              color: const Color(0xFF8B97A2),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    height: 2,
                                    thickness: 1,
                                    indent: 12,
                                    endIndent: 12,
                                    color: colorScheme.lineGray,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                      24,
                                      16,
                                      24,
                                      0,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Choose Dates',
                                          style: GoogleFonts.urbanist(
                                            textStyle: textScheme.bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                      16,
                                      12,
                                      16,
                                      0,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            0,
                                            0,
                                            0,
                                            8,
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () {
                                              _pickDate(context, 0);
                                            },
                                            child: Container(
                                              width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.44,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color:
                                                colorScheme.secondaryBackground,
                                                borderRadius: BorderRadius.circular(
                                                  8,
                                                ),
                                                border: Border.all(
                                                  color: colorScheme.lineGray,
                                                  width: 1,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                const EdgeInsetsGeometry.fromSTEB(
                                                  12,
                                                  5,
                                                  12,
                                                  5,
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      _selectedDate0 == null
                                                          ? 'Choose Date'
                                                          : _dateFormatter.format(
                                                        _selectedDate0!,
                                                      ),
                                                      style: GoogleFonts.urbanist(
                                                        textStyle:
                                                        textScheme.titleSmall,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.date_range_outlined,
                                                      color: colorScheme.grayIcon,
                                                      size: 24,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            _pickDate(context, 1);
                                          },
                                          child: Container(
                                            width:
                                            MediaQuery.sizeOf(context).width *
                                                0.44,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: colorScheme.secondaryBackground,
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                color: colorScheme.lineGray,
                                                width: 1,
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                              const EdgeInsetsGeometry.fromSTEB(
                                                12,
                                                5,
                                                12,
                                                5,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    _selectedDate1 == null
                                                        ? 'Choose Date'
                                                        : _dateFormatter.format(
                                                      _selectedDate1!,
                                                    ),
                                                    style: GoogleFonts.urbanist(
                                                      textStyle:
                                                      textScheme.titleSmall,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.date_range_outlined,
                                                    color: colorScheme.grayIcon,
                                                    size: 24,
                                                  ),
                                                ],
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
                                      16,
                                      24,
                                      0,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Number of Guestes',
                                          style: GoogleFonts.urbanist(
                                            textStyle: textScheme.bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                      16,
                                      0,
                                      16,
                                      0,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 12),
                                          child: Container(
                                            width: 160,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: colorScheme.secondaryBackground,
                                              borderRadius: BorderRadius.circular(40),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color: colorScheme.lineGray,
                                                width: 1,
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                10,
                                                0,
                                                10,
                                                0,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      _decrement();
                                                    },
                                                    icon: Icon(
                                                      Icons.remove,
                                                      color: colorScheme.grayIcon,
                                                    ),
                                                  ),
                                                  Text(
                                                    '$_guestCount',
                                                    style: GoogleFonts.urbanist(
                                                      textStyle:
                                                      textScheme.headlineMedium,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      _increment();
                                                    },
                                                    icon: Icon(
                                                      Icons.add,
                                                      color: colorScheme.primary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            24,
                                            16,
                                            24,
                                            0,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Choose an Option',
                                                style: GoogleFonts.urbanist(
                                                  textStyle: textScheme.bodyMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                      24,
                                      12,
                                      24,
                                      12,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                              0,
                                              8,
                                              0,
                                              8,
                                            ),
                                            child: BreakFastSelectionGrid(
                                              options: [
                                                'Breakfast',
                                                'No Breakfast',
                                                'Hot Tub Access',
                                                'No Access',
                                              ],
                                              maxItemsPerRow: 2,
                                            ),
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
                                      4,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Payment Infomation',
                                          style: GoogleFonts.urbanist(
                                            textStyle: textScheme.bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      12,
                                      0,
                                      12,
                                      0,
                                    ),
                                    child: CreditCardForm(
                                      obscureNumber: true,
                                      obscureCvv: false,
                                      spacing: 10,
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                          24,
                                          24,
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
                                                  color: const Color(0xFF8B97A2),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              //'\$156.00',
                                              AppConstants.formatPrice(
                                                (property.price ?? 0) * datesCal,
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                          24,
                                          12,
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
                                                  color: const Color(0xFF8B97A2),
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                          24,
                                          12,
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
                                                  color: const Color(0xFF8B97A2),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              AppConstants.formatPrice(
                                                property.cleaningFee ?? 0,
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                          24,
                                          12,
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
                                                      CustomFontWeight.normal,
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
                                                totalPrice,
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
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 100, // 임시
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              boxShadow: [
                                const BoxShadow(
                                  color: Color(0x55000000),
                                  blurRadius: 7,
                                  offset: Offset(0.0, -1),
                                ),
                              ],
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topRight: Radius.circular(16),
                                topLeft: Radius.circular(16),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                0,
                                0,
                                0,
                                34,
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  //context.go('/my_trip_details'); //여기부터 작업
                                  _onPressedBookNow(property,user);
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(130, 60),
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    0,
                                    0,
                                    0,
                                  ),
                                  backgroundColor: colorScheme.primary,
                                  elevation: 0,
                                  side: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  'Book Now',
                                  style: GoogleFonts.lexendDeca(
                                    textStyle: textScheme.displaySmall?.copyWith(
                                      fontSize: 20,
                                      fontWeight: CustomFontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },orElse: () => const SizedBox.shrink());
                  }
                );
              },
            );
          },
        ),
      ),
    );
  }
}
