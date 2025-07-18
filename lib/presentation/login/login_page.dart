import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants.dart';
import '../../core/custom/custom_font_weight.dart';
import '../../core/custom/custom_snack_bar.dart';
import '../../core/custom/custom_text_form_field_widget.dart';
import '../../core/theme/theme_extension.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var showPassword = false;

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;
    // BlocProvider: LoginBloc 인스턴스를 생성하고 위젯 트리에 제공합니다.
    // 이 Bloc은 LoginUseCase를 사용하여 로그인 로직을 처리합니다.
    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: Container(
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
              height: 500,
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
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
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
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomTextFormFieldWidget(
                                controller: TextEditingController(),
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
                                controller: TextEditingController(),
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
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
                                    // 사용가능 이메일인지 확인 이후 다음단계로 이동.
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                      colorScheme.primary,
                                    ),
                                    elevation: WidgetStateProperty.all(3.0),
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
                                        fontWeight: CustomFontWeight.bold,
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
                              onPressed: () => context.push('/create_account'),
                              child: SizedBox(
                                width: 90,
                                child: Text(
                                  'create account',
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
          ],
        ),
      ),
    );
  }
}
