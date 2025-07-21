part of 'property_bloc.bloc.dart';

abstract class PropertyEvent {
  const PropertyEvent();
}

class AddProperty extends PropertyEvent {
  AddProperty(this.propertyModel);

  final PropertyModel propertyModel;
}

class EditingProperty extends PropertyEvent {
  EditingProperty(this.propertyModel);
  final PropertyModel propertyModel;
}

// 새로운 이벤트 추가
class LoadProperties extends PropertyEvent {
  const LoadProperties();
}
