import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/custom/custom_font_weight.dart';
import '../../core/theme/theme_extension.dart';
import '../bloc/property/property_bloc.bloc.dart';

class TripSearchWidget extends StatefulWidget {
  const TripSearchWidget({super.key, required this.searchText});

  final Map<String, dynamic>? searchText;

  @override
  State<TripSearchWidget> createState() => _TripSearchWidgetState();
}

class _TripSearchWidgetState extends State<TripSearchWidget> {
  final TextEditingController _searchTextController = TextEditingController();


  @override
  void initState() {
    super.initState();
    context.read<PropertyBloc>().add(LoadSearchProperties(widget.searchText!));
    _searchTextController.text = widget.searchText!['searchText'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme
        .of(context)
        .textTheme;

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (result,data){
        context.read<PropertyBloc>().add(const LoadProperties());
      },
      child: Scaffold(
        backgroundColor: colorScheme.primaryBackground,
        appBar: AppBar(
          backgroundColor: colorScheme.dark600,
          automaticallyImplyLeading: false,
          leading: Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Color(0xFF95A1AC),
                size: 25,
              ),
            ),
          ),
          title: Text(
            'Search',
            style: GoogleFonts.lexendDeca(
              textStyle: textScheme.titleMedium?.copyWith(
                color: colorScheme.tertiary,
              ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: BlocBuilder<PropertyBloc, PropertyState>(
            buildWhen: (previous, current) =>
                current is SearchPropertiesLoaded,
            builder: (context, state) {
              return state.maybeWhen(
                  loading: () => const Center(child: CircularProgressIndicator(),),
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
                                          String propertyIdText = Uri.encodeComponent(
                                            property.propertyId.toString(),
                                          );
                                          String searchText = Uri.encodeComponent(
                                            _searchTextController.text,
                                          );
                                          context.push('/trip_details?propertyId=$propertyIdText&kind=search&searchText=$searchText',);
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
                                                property.propertyDescription ??
                                                    'No Description',
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
                                                        property.ratingSummary
                                                            ?.toStringAsFixed(1) ??
                                                            '0.0',
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
                  error: (message) => Center(child: Text('Error: $message'),) ,
                  orElse:() => const Center(child: Text('Inital State'),)
              );
            }
        ),
      ),
    );
  }
}
