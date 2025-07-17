import 'package:flutter/material.dart';

import '../theme/theme_extension.dart';

class CustomAmenitityIndicatorWidget extends StatelessWidget {
  const CustomAmenitityIndicatorWidget({super.key, required this.iconData});
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(
        0,
        0,
        8,
        0,
      ),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: context.colors.secondaryBackground,
          border: Border.all(
            color: context.colors.lineGray,
          ),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Icon(
          iconData,
          color: context.colors.grayIcon,
        ),
      ),
    );
  }
}
