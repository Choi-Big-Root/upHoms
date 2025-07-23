import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/custom/custom_snack_bar.dart';
import '../../../core/theme/theme_extension.dart';

class CancelTripWidget extends StatefulWidget {
  const CancelTripWidget({super.key, required this.onPressed});

  final Function onPressed;

  @override
  State<CancelTripWidget> createState() => _CancelTripWidgetState();
}

class _CancelTripWidgetState extends State<CancelTripWidget> {
  final TextEditingController _cancelTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _cancelTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 36),
      child: Container(
        width: double.infinity,
        height: 380,
        decoration: BoxDecoration(
          color: colorScheme.secondaryBackground,
          boxShadow: [
            const BoxShadow(
              color: Color(0x4D000000),
              blurRadius: 7,
              offset: Offset(0.0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                height: 16,
                thickness: 3,
                indent: 120,
                endIndent: 120,
                color: colorScheme.lineGray,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Text(
                  'Cancel Trip',
                  style: GoogleFonts.urbanist(
                    textStyle: textScheme.headlineMedium,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: Text(
                  'If you want to cancel your tripl please leave a note below to send to the host.',
                  style: GoogleFonts.urbanist(textStyle: textScheme.bodyMedium),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: TextFormField(
                  controller: _cancelTextEditingController,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsetsDirectional.fromSTEB(
                      16,
                      24,
                      0,
                      24,
                    ),
                    hintText: 'Your reason for cancelling...',
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
                  ),
                  style: GoogleFonts.urbanist(textStyle: textScheme.bodySmall),
                  maxLines: 4,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if(_cancelTextEditingController.text.isEmpty ) {
                        CustomSnackBar.showTopSnackBar(
                          context,
                          '취소 시 사유 입력은 필수 입니다.',
                          isError: true, // 에러 스타일 적용
                        );
                        return;
                      }
                      widget.onPressed(_cancelTextEditingController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      backgroundColor: colorScheme.redApple,
                      elevation: 2,
                      side: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Text(
                      'Yes, Cancel Trip',
                      style: GoogleFonts.urbanist(
                        textStyle: textScheme.titleSmall?.copyWith(
                          color: colorScheme.tertiary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: SizedBox(
                      width: 170,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          context.pop();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            0,
                            0,
                            0,
                            0,
                          ),
                          backgroundColor: colorScheme.lineGray,
                          elevation: 0,
                          side: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: Text(
                          'Never Mind',
                          style: GoogleFonts.urbanist(
                            textStyle: textScheme.titleSmall,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
