import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/theme/theme_extension.dart';

class CustomPropertyAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomPropertyAppBar({super.key, this.isEditMode = false});
  final bool isEditMode;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colors;
    final textScheme = Theme.of(context).textTheme;
    return AppBar(
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
          size: 25,
        ),
      ),
      title: Text(
        isEditMode ? 'Edit Property': 'Create Property',
        style: GoogleFonts.urbanist(textStyle: textScheme.headlineSmall),
      ),
      actions: [],
      centerTitle: false,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
