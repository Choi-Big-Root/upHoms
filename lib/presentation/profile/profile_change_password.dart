import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/custom/custom_font_weight.dart';
import '../../core/theme/theme_extension.dart';

class ProfileChangePassword extends StatefulWidget {
  const ProfileChangePassword({super.key});

  @override
  State<ProfileChangePassword> createState() => _ProfileChangePasswordState();
}

class _ProfileChangePasswordState extends State<ProfileChangePassword> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.secondaryBackground,
      appBar: AppBar(
        backgroundColor: colorScheme.secondaryBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: colorScheme.primaryText,
            size: 30,
          ),
        ),
        title: Text(
          'Change Password',
          style: GoogleFonts.urbanist(textStyle: textScheme.headlineMedium),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
              child: TextFormField(
                controller: TextEditingController(),
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  labelStyle: GoogleFonts.urbanist(
                    textStyle: textScheme.bodyMedium,
                  ),
                  hintText: 'Your Email..',
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
                  contentPadding: const EdgeInsetsDirectional.fromSTEB(
                    20,
                    24,
                    0,
                    24,
                  ),
                  //suffixIcon: InkWell(onTap: () {}, child: ,),
                ),
                style: GoogleFonts.urbanist(textStyle: textScheme.titleSmall),
              ),
            ),

            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'We will send you an email with a link to reset your password, please enter the email associated with your account above.',
                      style: GoogleFonts.urbanist(
                        textStyle: textScheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsGeometry.fromSTEB(0, 24, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  // 재사용 가능 버튼 위젯 대부분 해당 위젯 가져다 쓰면 문제 없을 것 같으니 사용.
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(colorScheme.primary),
                  elevation: WidgetStateProperty.all(2.0),
                  side: WidgetStateProperty.all(
                    const BorderSide(color: Colors.transparent, width: 1.0),
                  ),
                  alignment: const AlignmentDirectional(0, 0.05),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  minimumSize: WidgetStateProperty.all(const Size(340, 60)),
                ),
                child: Text(
                  'Send Reset Link',
                  style: GoogleFonts.lexendDeca(
                    textStyle: textScheme.titleSmall?.copyWith(
                      fontWeight: CustomFontWeight.normal,
                      color: Colors.white,
                    ),
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
