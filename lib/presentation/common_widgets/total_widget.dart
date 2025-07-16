import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/custom/custom_font_weight.dart';
import '../../core/theme/theme_extension.dart';

class TotalWidget extends StatelessWidget {
  const TotalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 36),
      child: Container(
        width: double.infinity,
        height: 230,
        constraints: const BoxConstraints(maxHeight: 230),
        decoration: BoxDecoration(
          color: context.colors.tertiary,
          boxShadow: [
            const BoxShadow(
              blurRadius: 7,
              offset: Offset(0.0, 3),
              color: Color(0x4D000000),
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
              const Divider(
                height: 16,
                thickness: 3,
                indent: 120,
                endIndent: 120,
                color: Color(0xFFD7DADD),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Text(
                  'Order Total',
                  style: GoogleFonts.urbanist(
                    textStyle: Theme.of(context).textTheme.headlineMedium
                        ?.copyWith(color: context.colors.dark600),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: Text(
                  'Your order total is a summary of all items in your order minus any fees and taxes associated with your purchase.',
                  style: GoogleFonts.urbanist(
                    textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: CustomFontWeight.light,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    decoration: BoxDecoration(
                      color: context.colors.cultured,
                      boxShadow: [
                        const BoxShadow(
                          color:  Color(0x4D000000),
                          blurRadius: 8, // 흐림 정도
                          offset: Offset(0, 2), // 수직 방향으로 그림자 내림
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8), // 선택적으로 둥글게
                    ),
                    child: Center(
                      child: Text(
                        'Okay',
                        style: GoogleFonts.urbanist(
                          textStyle: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(color: context.colors.primary),
                        ),
                      ),
                    ),
                  ),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
