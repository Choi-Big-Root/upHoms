import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'dart:io';
import 'dart:convert';

import '../../../../core/custom/custom_button_widget.dart';
import '../../../../core/theme/theme_extension.dart';
import '../../../../core/utils/validators.dart';
import '../../../../domain/model/property/property_model.dart';
import '../../../bloc/property/property_bloc.bloc.dart';
import '../../../routes/route_path.dart';
import 'common/custom_property_app_bar.dart';
import 'common/custom_property_textfield.dart';
import 'common/custom_property_textfield_dec.dart';

class PropertyStep1Widget extends StatefulWidget {
  const PropertyStep1Widget({super.key, this.property});

  final PropertyModel? property;

  @override
  State<PropertyStep1Widget> createState() => _PropertyStep1WidgetState();
}

class _PropertyStep1WidgetState extends State<PropertyStep1Widget> {
  final logger = Logger();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _propertyNameController = TextEditingController();
  final TextEditingController _propertyAddressController =
      TextEditingController();
  final TextEditingController _propertyNeighborhoodController =
      TextEditingController();
  final TextEditingController _propertyDescriptionController =
      TextEditingController();

  bool? isEditMode;

  XFile? _selectedImageFile;
  String? _selectedImageBase64;

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() {
        _selectedImageFile = image;
        final String fileExtension = image.path.split('.').last.toLowerCase();
        final String mimeType =
            'image/${fileExtension == 'jpg' ? 'jpeg' : fileExtension}';
        _selectedImageBase64 = 'data:$mimeType;base64,${base64Encode(bytes)}';
      });
    }
  }

  void _showImageSourceSelection() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: context.colors.secondaryBackground,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Gallery'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.property != null) {
      isEditMode = true;
      _propertyNameController.text = widget.property!.propertyName!;
      _propertyAddressController.text = widget.property!.propertyAddress!;
      _propertyNeighborhoodController.text =
          widget.property!.propertyNeighborhood!;
      _propertyDescriptionController.text =
          widget.property!.propertyDescription!;
      _selectedImageBase64 = widget.property!.mainImage;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _propertyNameController.dispose();
    _propertyAddressController.dispose();
    _propertyNeighborhoodController.dispose();
    _propertyDescriptionController.dispose();
  }

  PropertyModel _saveForm() {
    final propertyModel = PropertyModel(
      propertyName: _propertyNameController.text,
      propertyAddress: _propertyAddressController.text,
      propertyNeighborhood: _propertyNeighborhoodController.text,
      propertyDescription: _propertyDescriptionController.text,
      mainImage: _selectedImageBase64,
    );
    return propertyModel;
  }

  void _onPressedNextStep() {
    if (_formKey.currentState!.validate()) {
      context.read<PropertyBloc>().add(EditingProperty(_saveForm()));
      //context.push('/property_step2_widget');
      context.push(
        RoutePath.propertyStep2Widget, // 정의된 경로
        extra: widget.property,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (result, data) {
        isEditMode ?? false
            ? context.read<PropertyBloc>().add(
                LoadProperty({'propertyId': widget.property!.propertyId!}),
              )
            : context.read<PropertyBloc>().add(
                const LoadProperties(),
              );
      },
      child: Scaffold(
        backgroundColor: colorScheme.secondaryBackground,
        appBar: CustomPropertyAppBar(isEditMode: isEditMode ?? false),
        body: SafeArea(
          top: true,
          child: Form(
            key: _formKey,
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
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: _showImageSourceSelection,
                              child: Container(
                                width: double.infinity,
                                height: 180,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEEEEEE),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: _selectedImageFile == null
                                    ? _selectedImageBase64 == null
                                          ? Center(
                                              child: Text(
                                                'Add Cover Image',
                                                style: textScheme.headlineSmall
                                                    ?.copyWith(
                                                      color:
                                                          colorScheme.gray600,
                                                    ),
                                              ),
                                            )
                                          : widget.property!.mainImage !=
                                                    null &&
                                                widget.property!.mainImage!
                                                    .startsWith('data:image')
                                          ? Image.memory(
                                              base64Decode(
                                                widget.property!.mainImage!
                                                    .split(',')
                                                    .last,
                                              ),
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
                                              imageUrl:
                                                  widget.property!.mainImage ??
                                                  'https://picsum.photos/id/238/200/200.jpg',
                                              width: double.infinity,
                                              height: 190,
                                              fit: BoxFit.cover,
                                            )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.file(
                                          File(_selectedImageFile!.path),
                                          width: double.infinity,
                                          height: 180,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                            ),
                            const CustomPropertyTextFieldDec(
                              title: 'PROPERTY NAME',
                              topPadding: 12,
                            ),
                            CustomPropertyTextField(
                              controller: _propertyNameController,
                              hintText: 'Something Catchy...',
                              textInputType: TextInputType.text,
                              validator: (value) {
                                return AppValidators.validateRequired(
                                  value,
                                  '상품 이름',
                                );
                              },
                            ),

                            const CustomPropertyTextFieldDec(
                              title: 'PROPERTY ADDRESS',
                              topPadding: 8,
                            ),
                            CustomPropertyTextField(
                              controller: _propertyAddressController,
                              hintText: '123 Disney way here...',
                              textInputType: TextInputType.text,
                              maxLine: 2,
                              validator: (value) {
                                return AppValidators.validateRequired(
                                  value,
                                  '상품 주소',
                                );
                              },
                            ),

                            const CustomPropertyTextFieldDec(
                              title: 'NEIGHBORHOOD',
                              topPadding: 8,
                            ),
                            CustomPropertyTextField(
                              controller: _propertyNeighborhoodController,
                              hintText: 'Neighborhood or city...',
                              textInputType: TextInputType.text,
                              validator: (value) {
                                return AppValidators.validateRequired(
                                  value,
                                  '상품 지역',
                                );
                              },
                            ),

                            const CustomPropertyTextFieldDec(
                              title: 'DESCRIPTION',
                              topPadding: 8,
                            ),
                            CustomPropertyTextField(
                              controller: _propertyDescriptionController,
                              hintText: 'Description...',
                              textInputType: TextInputType.text,
                              maxLine: 4,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                0,
                                4,
                                0,
                                12,
                              ),
                              validator: (value) {
                                return AppValidators.validateRequired(
                                  value,
                                  '상품 설명',
                                );
                              },
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
                              '1/3',
                              style: GoogleFonts.urbanist(
                                textStyle: textScheme.headlineMedium,
                              ),
                            ),
                          ],
                        ),
                        CustomButtonWidget(
                          color: colorScheme.primary,
                          onPressed: () {
                            _onPressedNextStep();
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
        ),
      ),
    );
  }
}
