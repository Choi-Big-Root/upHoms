import 'package:flutter/material.dart';

import '../../../../domain/model/property/property_model.dart';
import 'property_step1_widget.dart';

class PropertyEditorWrapper extends StatelessWidget {
  const PropertyEditorWrapper({super.key, this.property});
  final PropertyModel? property;

  @override
  Widget build(BuildContext context) {
    return PropertyStep1Widget(property:property);
  }
}
