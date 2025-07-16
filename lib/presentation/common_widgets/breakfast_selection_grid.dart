import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/theme_extension.dart';

class BreakFastSelectionGrid extends StatefulWidget {
  const BreakFastSelectionGrid({
    super.key,
    required this.options,
    required this.maxItemsPerRow,
  });

  final List<String> options;
  final int maxItemsPerRow;

  @override
  State<BreakFastSelectionGrid> createState() => _BreakFastSelectionGridState();
}

class _BreakFastSelectionGridState extends State<BreakFastSelectionGrid> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final int totalRowIndex = (widget.options.length / widget.maxItemsPerRow)
        .ceil();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < totalRowIndex; i++) ...[
          if (i > 0) const SizedBox(height: 10), // Row 사이 간격
          Row(
            children: [
              for (int j = 0; j < widget.maxItemsPerRow; j++)
                if (i * widget.maxItemsPerRow + j < widget.options.length)
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = i * widget.maxItemsPerRow + j;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            selectedIndex == i * widget.maxItemsPerRow + j
                            ? context.colors.primary
                            : const Color(0xFFF1F4F8),
                        // 배경색
                        elevation: 4,
                        // 그림자 높이
                        shadowColor: const Color(0x4D000000),
                        // 그림자 색상
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // 모서리 둥글기
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          8,
                          4,
                          8,
                          4,
                        ),
                        child: Text(
                          widget.options[i * widget.maxItemsPerRow + j],
                          style: GoogleFonts.lexendDeca(
                            textStyle: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color:
                                      selectedIndex ==
                                          i * widget.maxItemsPerRow + j
                                      ? Colors.white
                                      : const Color(0xFF96A2AC),
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ],
      ],
    );
  }
}
