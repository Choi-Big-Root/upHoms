import 'package:flutter/material.dart';

import 'widgets/property_step1_widget.dart';

class PropertyEditorWrapper extends StatelessWidget {
  const PropertyEditorWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // bloc 로 수정모드인지 저장모드인지 지정하면 될듯?
    return const PropertyStep1Widget();
  }
}
