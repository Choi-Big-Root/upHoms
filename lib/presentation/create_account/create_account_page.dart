import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

import '../../core/constants.dart';
import '../../core/custom/custom_button_widget.dart';
import '../../core/custom/custom_font_weight.dart';
import '../../core/custom/custom_snack_bar.dart';
import '../../core/custom/custom_text_form_field_widget.dart';
import '../../core/theme/theme_data.dart';
import '../../domain/model/user/user_model.dart';
import '../bloc/user/user_bloc.bloc.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final logger = Logger();

  var _showPassword = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailAddressController.dispose();
    _passwordController.dispose();
    _displayNameController.dispose();
    _cityController.dispose();
    _phoneNumberController.dispose();
  }

  UserModel _saveForm() {
    final userModel = UserModel(
      userCity: _cityController.text,
      email: _emailAddressController.text,
      password: _passwordController.text,
      displayName: _displayNameController.text,
      phoneNumber: _phoneNumberController.text,
    );
    return userModel;
  }

  void _onPressedCreateAccount() {
    if (_formKey.currentState!.validate()) {
      logger.d(_saveForm().toString());
      context.read<UserBloc>().add(CreateUser(_saveForm()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).extension<ThemeColors>()!;
    final textScheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.secondaryBackground,
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          // 상태 변화에 따른 UI 액션
          state.when(
            initial: () {},
            loading: () {
              const CircularProgressIndicator();
            },
            success: () async {
              CustomSnackBar.showTopSnackBar(context, '계정이 성공적으로 생성되었습니다!',isError: false,isDismissPop: true);
            },
            error: (message) {
              CustomSnackBar.showTopSnackBar(
                context,
                message,
                isError: true, // 에러 스타일 적용
              );
            },
          );
        },
        builder: (BuildContext context, UserState state) {
          return Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 56),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          //화이트 일때 로고 이미지.
                          if (!(Theme.of(context).brightness ==
                              Brightness.dark))
                            Image.network(
                              '${AppConstants.imageFolderPath}/logo.png',
                              width: 200,
                              height: 60,
                              fit: BoxFit.fitWidth,
                            ),
                          //다크 일때 로고 이미지
                          if (Theme.of(context).brightness == Brightness.dark)
                            Image.network(
                              '${AppConstants.imageFolderPath}/logo.png',
                              width: 200,
                              height: 60,
                              fit: BoxFit.fitWidth,
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0,
                        16,
                        0,
                        4,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Get Started Below,',
                          style: GoogleFonts.urbanist(
                            textStyle: textScheme.displaySmall,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0,
                        16,
                        0,
                        0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomTextFormFieldWidget(
                              controller: _emailAddressController,
                              obscureText: false,
                              labelText: 'Email Address',
                              labelStyle: GoogleFonts.urbanist(
                                textStyle: textScheme.bodyMedium,
                              ),
                              hintText: 'Enter your email here...',
                              hintStyle: GoogleFonts.urbanist(
                                textStyle: textScheme.bodyMedium,
                              ),
                              contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                    16,
                                    24,
                                    0,
                                    24,
                                  ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '필수 입력사항 입니다.';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0,
                        16,
                        0,
                        0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomTextFormFieldWidget(
                              controller: _passwordController,
                              obscureText: !_showPassword,
                              labelText: 'Password',
                              labelStyle: GoogleFonts.urbanist(
                                textStyle: textScheme.bodyMedium,
                              ),
                              hintText: 'Enter your password here...',
                              hintStyle: GoogleFonts.urbanist(
                                textStyle: textScheme.bodyMedium,
                              ),
                              contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                    16,
                                    24,
                                    0,
                                    24,
                                  ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: const Color(0xFF95A1AC),
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0,
                        16,
                        0,
                        0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomTextFormFieldWidget(
                              controller: _displayNameController,
                              obscureText: false,
                              labelText: 'Display Name',
                              labelStyle: GoogleFonts.urbanist(
                                textStyle: textScheme.bodyMedium,
                              ),
                              hintText: 'Enter your d.n here...',
                              hintStyle: GoogleFonts.urbanist(
                                textStyle: textScheme.bodyMedium,
                              ),
                              contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                    16,
                                    24,
                                    0,
                                    24,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0,
                        16,
                        0,
                        0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomTextFormFieldWidget(
                              controller: _cityController,
                              obscureText: false,
                              labelText: 'City',
                              labelStyle: GoogleFonts.urbanist(
                                textStyle: textScheme.bodyMedium,
                              ),
                              hintText: 'Enter your city here...',
                              hintStyle: GoogleFonts.urbanist(
                                textStyle: textScheme.bodyMedium,
                              ),
                              contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                    16,
                                    24,
                                    0,
                                    24,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0,
                        16,
                        0,
                        0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomTextFormFieldWidget(
                              controller: _phoneNumberController,
                              obscureText: false,
                              labelText: 'Phone Number',
                              labelStyle: GoogleFonts.urbanist(
                                textStyle: textScheme.bodyMedium,
                              ),
                              hintText: 'Enter your p.n here...',
                              hintStyle: GoogleFonts.urbanist(
                                textStyle: textScheme.bodyMedium,
                              ),
                              contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                    16,
                                    24,
                                    0,
                                    24,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //submit Button
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0,
                        24,
                        0,
                        0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              0,
                              0,
                              4,
                              0,
                            ),
                            child: CustomButtonWidget(
                              color: colorScheme.primary,
                              onPressed: () {
                                _onPressedCreateAccount();
                              },
                              elevation: 3.0,
                              circular: 25,
                              size: const Size(230, 50),
                              text: 'Create Account',
                              style: GoogleFonts.lexendDeca(
                                textStyle: textScheme.titleMedium?.copyWith(
                                  fontWeight: CustomFontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0,
                        16,
                        0,
                        24,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              20,
                              0,
                              0,
                              0,
                            ),
                            child: Text(
                              'Already have an account?',
                              style: GoogleFonts.lexendDeca(
                                textStyle: textScheme.bodyMedium,
                                color: colorScheme.secondaryText,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => context.go('/login'),
                            child: SizedBox(
                              width: 90,
                              child: Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lexendDeca(
                                  textStyle: textScheme.titleSmall,
                                  fontWeight: CustomFontWeight.bold,
                                  fontSize: 14,
                                  color: colorScheme.turquoise,
                                ),
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
