import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

import '../../../../core/custom/custom_button_widget.dart';
import '../../../../core/custom/custom_snack_bar.dart';
import '../../../../core/theme/theme_extension.dart';
import '../../../../core/utils/validators.dart';
import '../../../../domain/model/property/property_model.dart';
import '../../../../domain/model/user/user_model.dart';
import '../../../bloc/property/property_bloc.bloc.dart';
import '../../../bloc/user/user_bloc.bloc.dart';
import '../../../cubit/message_cubit.dart';
import 'common/custom_property_app_bar.dart';
import 'common/custom_property_textfield.dart';
import 'common/custom_property_textfield_dec.dart';

class PropertyStep3Widget extends StatefulWidget {
  const PropertyStep3Widget({super.key, this.property});

  final PropertyModel? property;

  @override
  State<PropertyStep3Widget> createState() => _PropertyStep3WidgetState();
}

class _PropertyStep3WidgetState extends State<PropertyStep3Widget> {
  final logger = Logger();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool? isEditMode;

  bool isLive = false;
  int _guestCount = 1;
  final TextEditingController _priceTextController = TextEditingController();
  final TextEditingController _taxRateTextController = TextEditingController();
  final TextEditingController _cleaningFeeTextController =
      TextEditingController();
  final TextEditingController _notesTextController = TextEditingController();

  //Proper
  PropertyModel _saveProperty(PropertyModel property, UserModel? user) {
    final reqProperty = property.copyWith(
      price: int.parse(_priceTextController.text),
      taxRate: double.parse(_taxRateTextController.text),
      cleaningFee: int.parse(_cleaningFeeTextController.text),
      notes: _notesTextController.text,
      isLive: isLive,
      minNightStay: _guestCount,
      user: user,
    );
    return reqProperty;
  }

  @override
  void initState() {
    super.initState();
    if (widget.property != null) {
      isEditMode = true;
      _priceTextController.text = widget.property!.price!.toString();
      _taxRateTextController.text = widget.property!.taxRate!.toString();
      _cleaningFeeTextController.text = widget.property!.cleaningFee!
          .toString();
      _notesTextController.text = widget.property!.notes!;
      isLive = widget.property!.isLive!;
      _guestCount = widget.property!.minNightStay!;
    }
  }

  void _onPressedSubmit(PropertyModel property, UserModel? user) {
    if (_formKey.currentState!.validate()) {
      if (isEditMode ?? false) {
        context.read<PropertyBloc>().add(
          UpdateProperty(_saveProperty(property, user)),
        );
      } else {
        context.read<PropertyBloc>().add(
          AddProperty(_saveProperty(property, user)),
        );
      }
    }
  }

  void _increment() {
    setState(() {
      if (_guestCount < 8) _guestCount++;
    });
  }

  void _decrement() {
    setState(() {
      if (_guestCount > 1) _guestCount--;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _priceTextController.dispose();
    _taxRateTextController.dispose();
    _cleaningFeeTextController.dispose();
    _notesTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;
    return MultiBlocListener(
      listeners: [
        BlocListener<PropertyBloc, PropertyState>(
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                context.read<MessageCubit>().showSuccessMessage(
                  '성공적으로 등록 되었습니다!',
                );
                if(isEditMode ?? false){
                  context.go('/profile_my_property');
                }else{
                  context.go('/profile');
                }

              },
              error: (err) {
                context.read<MessageCubit>().showErrorMessage(err);
                context.go('/profile');
              },
              editing: (property) {},
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ],
      child: BlocBuilder<UserBloc, UserState>(
        buildWhen: (previous, current) => current is Success,
        // UserBloc 빌더 추가
        builder: (userContext, userState) {
          UserModel? userModel;
          userState.maybeWhen(
            success: (user) {
              // UserState가 authenticated일 경우 사용자 정보 사용
              userModel = user; // user 모델에 id가 있다고 가정
            },
            orElse: () {
              // 사용자가 인증되지 않은 경우 (예: 로그인 필요)
              logger.w('User is not authenticated.');
              userModel = null;
            },
          );
          return BlocBuilder<PropertyBloc, PropertyState>(
            buildWhen: (previous, current) => current is Editing,
            builder: (context, state) {
              return Scaffold(
                backgroundColor: colorScheme.secondaryBackground,
                appBar: CustomPropertyAppBar(isEditMode: isEditMode ?? false),
                body: SafeArea(
                  top: true,
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0,
                        12,
                        0,
                        0,
                      ),
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
                                    const CustomPropertyTextFieldDec(
                                      title: 'PRICE PER NIGHT',
                                      topPadding: 12,
                                    ),
                                    CustomPropertyTextField(
                                      controller: _priceTextController,
                                      hintText: 'Price',
                                      textInputType: TextInputType.number,
                                      validator: (value) {
                                        return AppValidators.validateRequired(
                                          value,
                                          '상품 가격',
                                          isOnlyNumber: true,
                                        );
                                      },
                                    ),
                                    const CustomPropertyTextFieldDec(
                                      title: 'MINIMUM NIGHT STAY',
                                      topPadding: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 200,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: colorScheme
                                                  .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(40),
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      _decrement();
                                                    },
                                                    icon: Icon(
                                                      Icons.remove,
                                                      color:
                                                          colorScheme.grayIcon,
                                                    ),
                                                  ),
                                                  Text(
                                                    '$_guestCount',
                                                    style: GoogleFonts.urbanist(
                                                      textStyle: textScheme
                                                          .headlineMedium,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      _increment();
                                                    },
                                                    icon: Icon(
                                                      Icons.add,
                                                      color:
                                                          colorScheme.primary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Divider(
                                      color: colorScheme.lineGray,
                                      height: 32,
                                      thickness: 2,
                                    ),

                                    const CustomPropertyTextFieldDec(
                                      title: 'TAX RATE',
                                      topPadding: 8,
                                    ),
                                    CustomPropertyTextField(
                                      controller: _taxRateTextController,
                                      hintText: '% Rate',
                                      // validator: (value) {
                                      //   return AppValidators.validateRequired(
                                      //     value,
                                      //     '세금',
                                      //     isOnlyNumber: true,
                                      //   );
                                      // },
                                    ),

                                    const CustomPropertyTextFieldDec(
                                      title: 'CLEANING FEE',
                                      topPadding: 8,
                                    ),
                                    CustomPropertyTextField(
                                      controller: _cleaningFeeTextController,
                                      hintText: 'Price',
                                      validator: (value) {
                                        return AppValidators.validateRequired(
                                          value,
                                          '정리 수수료',
                                          isOnlyNumber: true,
                                        );
                                      },
                                    ),

                                    const CustomPropertyTextFieldDec(
                                      title: 'Additional Notes',
                                      topPadding: 8,
                                    ),
                                    CustomPropertyTextField(
                                      controller: _notesTextController,
                                      hintText: 'Additional notes...',
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            0,
                                            4,
                                            0,
                                            12,
                                          ),
                                      maxLine: 3,
                                      validator: (value) {
                                        return AppValidators.validateRequired(
                                          value,
                                          '메모',
                                        );
                                      },
                                    ),
                                    Divider(
                                      color: colorScheme.lineGray,
                                      height: 1,
                                      thickness: 2,
                                    ),
                                    isEditMode ?? false
                                        ? Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                  0,
                                                  0,
                                                  0,
                                                  20,
                                                ),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: SwitchListTile.adaptive(
                                                value: isLive,
                                                onChanged: (newValue) async {
                                                  setState(() {
                                                    isLive = newValue;
                                                  });
                                                },
                                                title: Text(
                                                  'Listing is Live',
                                                  style: GoogleFonts.urbanist(
                                                    textStyle: textScheme
                                                        .headlineSmall,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  'Turn this on for guests to start booking your listing.',
                                                  style: GoogleFonts.urbanist(
                                                    textStyle:
                                                        textScheme.bodyMedium,
                                                  ),
                                                ),
                                                tileColor: context
                                                    .colors
                                                    .secondaryBackground,
                                                activeTrackColor: const Color(
                                                  0xFF392BBA,
                                                ),
                                                inactiveTrackColor:
                                                    Colors.white,
                                                inactiveThumbColor: context
                                                    .colors
                                                    .secondaryText,
                                                dense: false,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                contentPadding:
                                                    const EdgeInsets.all(0),
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink(),
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
                                      '3/3',
                                      style: GoogleFonts.urbanist(
                                        textStyle: textScheme.headlineMedium,
                                      ),
                                    ),
                                  ],
                                ),
                                CustomButtonWidget(
                                  color: colorScheme.turquoise,
                                  onPressed: () {
                                    state.maybeWhen(
                                      orElse: () => const SizedBox.shrink(),
                                      editing: (data) {
                                        if (isEditMode ?? false) {
                                          final editData = data.copyWith(
                                            propertyId:
                                                widget.property!.propertyId,
                                          );
                                          _onPressedSubmit(editData, userModel);
                                          return;
                                        } else {
                                          _onPressedSubmit(data, userModel);
                                        }
                                      },
                                    );
                                  },
                                  elevation: 2.0,
                                  circular: 60,
                                  size: const Size(200, 50),
                                  text: isEditMode ?? false
                                      ? 'Save Changes'
                                      : 'PUBLISH',
                                  style: GoogleFonts.urbanist(
                                    textStyle: textScheme.headlineSmall
                                        ?.copyWith(color: colorScheme.tertiary),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Generated code for this SwitchListTile Widget...
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
