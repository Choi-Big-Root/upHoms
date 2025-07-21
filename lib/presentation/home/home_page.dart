import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // 추가
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert'; // 추가

import '../../core/constants.dart';
import '../../core/custom/custom_font_weight.dart';
import '../../core/theme/theme_extension.dart';
import '../bloc/property/property_bloc.bloc.dart'; // 추가
import '../../domain/model/property/property_model.dart'; // 추가

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 페이지 로드 시 LoadProperties 이벤트 디스패치
    context.read<PropertyBloc>().add(const LoadProperties());
  }
  @override
  void dispose() {
    super.dispose();
    _searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.primaryBackground,
      body: BlocBuilder<PropertyBloc, PropertyState>(
        // BlocBuilder 추가
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            propertiesLoaded: (properties) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        color: colorScheme.dark600,
                        boxShadow: [
                          const BoxShadow(
                            blurRadius: 3,
                            color: Color(0x39000000),
                            offset: Offset(0.0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              24,
                              40,
                              0,
                              0,
                            ),
                            child: Image.network(
                              '${AppConstants.imageFolderPath}/logo.png',
                              width: 160,
                              height: 50,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              24,
                              12,
                              24,
                              8,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'WelCome!',
                                  style: GoogleFonts.urbanist(
                                    textStyle: textScheme.displaySmall
                                        ?.copyWith(color: colorScheme.tertiary),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Find your Dream Space To Getaway',
                                  style: GoogleFonts.urbanist(
                                    textStyle: textScheme.titleSmall?.copyWith(
                                      color: colorScheme.grayIcon,
                                      fontWeight: CustomFontWeight.light,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              16,
                              16,
                              16,
                              0,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                color: colorScheme.primaryBackground,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              alignment: const AlignmentDirectional(0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            4,
                                            0,
                                            4,
                                            0,
                                          ),
                                      child: TextFormField(
                                        controller: _searchTextController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Address, city, state...',
                                          labelStyle: GoogleFonts.urbanist(
                                            textStyle: textScheme.bodyMedium
                                                ?.copyWith(
                                                  color: colorScheme.grayIcon,
                                                ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                          prefixIcon: Icon(
                                            Icons.search_sharp,
                                            color: colorScheme.grayIcon,
                                          ),
                                        ),
                                        style: GoogleFonts.urbanist(
                                          textStyle: textScheme.bodyMedium
                                              ?.copyWith(
                                                color: colorScheme.primaryText,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          0,
                                          8,
                                          0,
                                        ),
                                    child: SizedBox(
                                      width: 100,
                                      height: 40,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if(_searchTextController.text.isNotEmpty){
                                            String encodedSearchText = Uri.encodeComponent(_searchTextController.text); // URL 인코딩
                                            context.push('/trip_search?searchText=$encodedSearchText');
                                          }

                                        },
                                        style: ButtonStyle(
                                          padding: WidgetStateProperty.all(
                                            const EdgeInsetsDirectional.fromSTEB(
                                              0,
                                              0,
                                              0,
                                              0,
                                            ),
                                          ),
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                                colorScheme.primary,
                                              ),
                                          elevation: WidgetStateProperty.all(
                                            3.0,
                                          ),
                                          side: WidgetStateProperty.all(
                                            const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                          ),
                                          shape: WidgetStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'Search',
                                          style: GoogleFonts.urbanist(
                                            textStyle: textScheme.titleSmall
                                                ?.copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: properties.length,
                        // 불러온 속성 목록의 길이 사용
                        itemBuilder: (context, index) {
                          final property =
                              properties[index]; // PropertyModel 사용
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
                                    blurRadius: 4,
                                    color: Color(0x32000000),
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
                                  context.push('/trip_details');
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                      child: property.mainImage != null && property.mainImage!.startsWith('data:image')
                                          ? Image.memory(
                                              base64Decode(property.mainImage!.split(',').last),
                                              width: double.infinity,
                                              height: 190,
                                              fit: BoxFit.cover,
                                            )
                                          : CachedNetworkImage(
                                              fadeInDuration: const Duration(
                                                milliseconds: 500,
                                              ),
                                              fadeOutDuration: const Duration(
                                                milliseconds: 500,
                                              ),
                                              imageUrl: property.mainImage ?? 'https://picsum.photos/id/238/200/200.jpg',
                                              width: double.infinity,
                                              height: 190,
                                              fit: BoxFit.cover,
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
                                          Expanded(
                                            child: Text(
                                              property.propertyName ??
                                                  'No Name', // 속성 이름 사용
                                              style: GoogleFonts.urbanist(
                                                textStyle:
                                                    textScheme.headlineSmall,
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
                                            8,
                                          ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              property.propertyDescription ??
                                                  'No Description', // 속성 설명 사용
                                              style: GoogleFonts.urbanist(
                                                textStyle:
                                                    textScheme.bodyMedium,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                              16,
                                              0,
                                              24,
                                              12,
                                            ),
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
                                                    4,
                                                    0,
                                                    0,
                                                    0,
                                                  ),
                                              child: Text(
                                                property.ratingSummary
                                                        ?.toStringAsFixed(1) ??
                                                    '0.0', // 평점 사용
                                                style: GoogleFonts.urbanist(
                                                  textStyle:
                                                      textScheme.bodyMedium,
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
                                                'Rating',
                                                style: GoogleFonts.urbanist(
                                                  textStyle:
                                                      textScheme.bodyMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                  ],
                ),
              );
            },
            error: (message) => Center(child: Text('Error: $message')),
            searchPropertiesLoaded: (properties){
              return SafeArea(
                top: true,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: colorScheme.dark600,
                          boxShadow: [
                            const BoxShadow(
                              blurRadius: 3,
                              color: Color(0x39000000),
                              offset: Offset(0.0, 1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 4, 0),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: const AlignmentDirectional(0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                      4,
                                      0,
                                      4,
                                      0,
                                    ),
                                    child: TextFormField(
                                      controller: _searchTextController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Address, city, state...',
                                        labelStyle: GoogleFonts.urbanist(
                                          textStyle: textScheme.bodyMedium?.copyWith(
                                            color: colorScheme.grayIcon,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.search_sharp,
                                          color: colorScheme.grayIcon,
                                        ),
                                      ),
                                      style: GoogleFonts.urbanist(
                                        textStyle: textScheme.bodyMedium?.copyWith(
                                          color: colorScheme.tertiary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    0,
                                    8,
                                    0,
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context.read<PropertyBloc>().add(LoadSearchProperties({'searchText':_searchTextController.text}));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(100, 40),
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                        0,
                                        0,
                                        0,
                                        0,
                                      ),
                                      backgroundColor: colorScheme.primary,
                                      elevation: 2,
                                      side: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    child: Text(
                                      'Search',
                                      style: GoogleFonts.urbanist(
                                        textStyle: textScheme.titleSmall?.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsGeometry.fromSTEB(0, 12, 0, 0),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: properties.length,
                          itemBuilder: (context, index) {
                            final property = properties[index];
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
                                      blurRadius: 4,
                                      color: Color(0x32000000),
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
                                    context.push('/trip_details');
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: property.mainImage != null && property.mainImage!.startsWith('data:image')
                                            ? Image.memory(
                                          base64Decode(property.mainImage!.split(',').last),
                                          width: double.infinity,
                                          height: 190,
                                          fit: BoxFit.cover,
                                        )
                                            : CachedNetworkImage(
                                          fadeInDuration: const Duration(
                                            milliseconds: 500,
                                          ),
                                          fadeOutDuration: const Duration(
                                            milliseconds: 500,
                                          ),
                                          imageUrl: property.mainImage ?? 'https://picsum.photos/id/238/200/200.jpg',
                                          width: double.infinity,
                                          height: 190,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                          16,
                                          8,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          property.propertyName ?? 'No Name',
                                          style: GoogleFonts.urbanist(
                                            textStyle: textScheme.headlineSmall
                                                ?.copyWith(
                                              color: colorScheme.darkText,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                          16,
                                          4,
                                          0,
                                          0,
                                        ),
                                        child: Text(
                                          '[tripNeighborhood]',
                                          style: GoogleFonts.lexendDeca(
                                            textStyle: textScheme.bodySmall?.copyWith(
                                              color: colorScheme.grayIcon,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                            16,
                                            0,
                                            24,
                                            12,
                                          ),
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
                                                  4,
                                                  0,
                                                  0,
                                                  0,
                                                ),
                                                child: Text(
                                                  '[ratingSummaryList(a)]',
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
                                              Padding(
                                                padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                  2,
                                                  0,
                                                  0,
                                                  0,
                                                ),
                                                child: Text(
                                                  'Rating',
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
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            success: () => Center(child: Text('success'),),
            initial: ()=>Center(child: Text('success22'),),
            editing: (s)=> Center(child: Text('success2233333'),),
          );
        },
      ),
    );
  }
}
