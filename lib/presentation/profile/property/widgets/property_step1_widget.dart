import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

import '../../../../core/custom/custom_button_widget.dart';
import '../../../../core/custom/custom_font_weight.dart';
import '../../../../core/theme/theme_extension.dart';
import '../../../../core/utils/validators.dart';
import '../../../../domain/model/property/property_model.dart';
import '../../../bloc/property/property_bloc.bloc.dart';
import 'common/custom_property_app_bar.dart';
import 'common/custom_property_textfield.dart';
import 'common/custom_property_textfield_dec.dart';

class PropertyStep1Widget extends StatefulWidget {
  const PropertyStep1Widget({super.key});

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
    );
    return propertyModel;
  }

  void _onPressedNextStep() {
    if (_formKey.currentState!.validate()) {
      logger.d(_saveForm().toString());
      context.read<PropertyBloc>().add(EditingProperty(_saveForm()));
      context.push('/property_step2_widget');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.secondaryBackground,
      appBar: const CustomPropertyAppBar(),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {},
                            child: Container(
                              width: double.infinity,
                              height: 180,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),

                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://picsum.photos/id/328/200/200.jpg',
                                  fadeOutDuration: const Duration(
                                    milliseconds: 500,
                                  ),
                                  fadeInDuration: const Duration(
                                    milliseconds: 500,
                                  ),
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
    );
  }
}
