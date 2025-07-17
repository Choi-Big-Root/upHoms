import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/theme_extension.dart';

class ProfileRoutesInkwellWidget extends StatefulWidget {
  const ProfileRoutesInkwellWidget({
    super.key,
    required this.title,
    required this.isFirstRow,
    this.onTapAction,
    this.tripCount = 0,
  });

  final String title;
  final bool isFirstRow;
  final VoidCallback? onTapAction;
  final int? tripCount;

  @override
  State<ProfileRoutesInkwellWidget> createState() =>
      _ProfileRoutesInkwellWidgetState();
}

class _ProfileRoutesInkwellWidgetState
    extends State<ProfileRoutesInkwellWidget> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: widget.isFirstRow
              ? const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0)
              : const EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: widget.onTapAction,
            child: Material(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 50,
                decoration: BoxDecoration(
                  color: colorScheme.secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.lineGray,
                      blurRadius: 0,
                      offset: const Offset(0.0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(0),
                  border: Border.all(
                    color: colorScheme.secondaryBackground,
                    width: 0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 4, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.tripCount! <= 0 ?
                      Text(
                        widget.title,
                        style: GoogleFonts.urbanist(
                          textStyle: textScheme.titleSmall,
                        ),
                      ):Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                widget.title,
                                style: GoogleFonts.urbanist(
                                  textStyle: textScheme.titleSmall,
                                ),
                              ),
                            ),
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: colorScheme.primary,
                                shape: BoxShape.circle,
                              ),
                              alignment: const AlignmentDirectional(0, 0),
                              child: Text(
                                '[4]',
                                style: GoogleFonts.urbanist(
                                  textStyle: textScheme.bodyMedium
                                      ?.copyWith(
                                    color: colorScheme.tertiary,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 46,
                        height: 46,
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: Color(0xFF95A1AC),
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
