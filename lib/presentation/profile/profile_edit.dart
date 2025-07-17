import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/custom/custom_font_weight.dart';
import '../../core/theme/theme_extension.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
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
            size: 24,
          ),
        ),
        title: Text(
          'Edit Profile',
          style: GoogleFonts.urbanist(textStyle: textScheme.titleSmall),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDBE7E7),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ClipOval(
                      child: Image.network(
                        'https://picsum.photos/id/338/200/200.jpg',
                        fit: BoxFit.fitWidth,
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    colorScheme.lineGray,
                  ),
                  elevation: WidgetStateProperty.all(2.0),
                  side: WidgetStateProperty.all(
                    const BorderSide(color: Colors.transparent, width: 1.0),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  minimumSize: WidgetStateProperty.all(const Size(130, 40)),
                ),
                child: Text(
                  'Change Photo',
                  style: GoogleFonts.lexendDeca(
                    textStyle: textScheme.bodyMedium?.copyWith(
                      fontWeight: CustomFontWeight.normal,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
              child: TextFormField(
                controller: TextEditingController(),
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: GoogleFonts.urbanist(
                    textStyle: textScheme.bodyMedium,
                  ),
                  hintText: 'Your full name..',
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
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
              child: TextFormField(
                controller: TextEditingController(),
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  labelStyle: GoogleFonts.urbanist(
                    textStyle: textScheme.bodyMedium,
                  ),
                  hintText: 'Your email..',
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
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
              child: TextFormField(
                controller: TextEditingController(),
                maxLines: 3,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Bio',
                  labelStyle: GoogleFonts.urbanist(
                    textStyle: textScheme.bodyMedium,
                  ),
                  hintText: 'A title about you..',
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
              padding: const EdgeInsetsGeometry.fromSTEB(0, 24, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  // 사용가능 이메일인지 확인 이후 다음단계로 이동.
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(colorScheme.primary),
                  elevation: WidgetStateProperty.all(2.0),
                  side: WidgetStateProperty.all(
                    const BorderSide(color: Colors.transparent, width: 1.0),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  minimumSize: WidgetStateProperty.all(const Size(340, 60)),
                ),
                child: Text(
                  'Save Changes',
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
