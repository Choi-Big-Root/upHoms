import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import '../../core/constants.dart';
import '../../core/custom/custom_font_weight.dart';
import '../../core/custom/custom_snack_bar.dart';
import '../../core/custom/custom_text_form_field_widget.dart';
import '../../core/theme/theme_extension.dart';
import '../../core/utils/validators.dart';
import '../../domain/model/user/user_model.dart';
import '../bloc/user/user_bloc.bloc.dart';
import '../cubit/message_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final logger = Logger();

  var showPassword = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailAddressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  UserModel _saveForm() {
    final userModel = UserModel(
      email: _emailAddressController.text,
      password: _passwordController.text,
    );
    return userModel;
  }

  void _onPressedLogin() {
    if (_formKey.currentState!.validate()) {
      logger.d(_saveForm().toString());
      context.read<UserBloc>().add(GetUser(_saveForm()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: MultiBlocListener(
        listeners: [
          BlocListener<UserBloc, UserState>(
            listener: (BuildContext context, UserState state) {
              state.when(
                initial: () {},
                loading: () {
                  const CircularProgressIndicator();
                },
                success: () async {
                  context.read<MessageCubit>().showSuccessMessage(
                    '로그인 성공 : ${_emailAddressController.text}',
                  );
                  context.go('/home');
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
          ),
          BlocListener<MessageCubit, MessageState>(
            listener: (context, state) {
              state.when(
                initial: () {},
                success: (message, onDismissed) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    CustomSnackBar.showTopSnackBar(
                      context,
                      message,
                      isError: false,
                      onDismissed: onDismissed,
                    );
                    context.read<MessageCubit>().clearMessage();
                  });
                },
                error: (message) {},
                none: () {},
              );
            },
          ),
        ],
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(
                color: colorScheme.tertiary,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.network(
                    '${AppConstants.imageFolderPath}/main_bg.png',
                  ).image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 550,
                    decoration: BoxDecoration(
                      color: colorScheme.secondaryBackground,
                      boxShadow: [
                        const BoxShadow(
                          blurRadius: 7,
                          color: Color(0x4D090F13),
                          offset: Offset(0.0, 3),
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        20,
                        0,
                        20,
                        0,
                      ),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
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
                                    if (Theme.of(context).brightness ==
                                        Brightness.dark)
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
                                padding: const EdgeInsets.only(top: 16),
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
                                          return AppValidators.validateRequired(
                                            value,
                                            '이메일',
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: CustomTextFormFieldWidget(
                                        controller: _passwordController,
                                        obscureText: !showPassword,
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
                                              showPassword = !showPassword;
                                            });
                                          },
                                          child: Icon(
                                            showPassword
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: const Color(0xFF95A1AC),
                                            size: 22,
                                          ),
                                        ),
                                        validator: (value) {
                                          return AppValidators.validateRequired(
                                            value,
                                            '비밀번호',
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            0,
                                            0,
                                            4,
                                            0,
                                          ),
                                      child: SizedBox(
                                        width: 230,
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _onPressedLogin();
                                          },
                                          style: ButtonStyle(
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
                                          ),
                                          child: Text(
                                            'Login',
                                            style: GoogleFonts.lexendDeca(
                                              textStyle: textScheme.titleMedium
                                                  ?.copyWith(
                                                    fontWeight:
                                                        CustomFontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                            ),
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            20,
                                            0,
                                            0,
                                            0,
                                          ),
                                      child: Text(
                                        'Don\'t have an account?',
                                        style: GoogleFonts.lexendDeca(
                                          textStyle: textScheme.bodyMedium,
                                          color: colorScheme.secondaryText,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          context.push('/create_account'),
                                      child: SizedBox(
                                        width: 150,
                                        child: Text(
                                          'Create Account',
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
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
