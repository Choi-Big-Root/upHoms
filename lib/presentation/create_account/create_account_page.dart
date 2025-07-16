import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants.dart';
import '../../core/custom/custom_font_weight.dart';
import '../../core/custom/custom_theme.dart';
import '../../core/theme/theme_data.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  var showPassword = false; // 추후에 상태관리 데이터로 변경.

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).extension<ThemeColors>()!;
    final textScheme = Theme.of(context).textTheme;

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
                            if(Theme.of(context).brightness == Brightness.dark)
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
                            'Welcome Back,',
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
                              child: TextFormField(
                                //controller: ,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
                                  labelStyle: GoogleFonts.urbanist(
                                    textStyle: textScheme.bodyMedium,
                                  ),
                                  hintText: 'Enter your email here...',
                                  hintStyle: GoogleFonts.urbanist(
                                    textStyle: textScheme.bodyMedium,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: colorScheme.lineGray,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: colorScheme.lineGray,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0X00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0X00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: colorScheme.secondaryBackground,
                                  contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                    16,
                                    24,
                                    0,
                                    24,
                                  ),
                                ),
                                style: GoogleFonts.urbanist(
                                  textStyle: textScheme.titleSmall,
                                ),
                                //validator: ,
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
                              child: TextFormField(
                                obscureText: !showPassword,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: GoogleFonts.urbanist(
                                    textStyle: textScheme.bodyMedium,
                                  ),
                                  hintText: 'Enter your password here...',
                                  hintStyle: GoogleFonts.urbanist(
                                    textStyle: textScheme.bodyMedium,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: colorScheme.lineGray,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: colorScheme.lineGray,
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
                                  filled: true,
                                  fillColor: colorScheme.secondaryBackground,
                                  contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                    16,
                                    24,
                                    24,
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
                                style: GoogleFonts.urbanist(
                                  textStyle: textScheme.titleSmall,
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
                                    'Create Account',
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
                              onPressed: () => context.push('/login'),
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
            ),
          ],
        ),
      ),
    );
  }
}
