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

class LoadProperties extends PropertyEvent {
  const LoadProperties();
}

class LoadSearchProperties extends PropertyEvent {
  const LoadSearchProperties(this.searchText);
  final Map<String, dynamic> searchText;
}

class LoadProperty extends PropertyEvent {
  const LoadProperty(this.propertyId);
  final Map<String, dynamic> propertyId;
}

class UpdateProperty extends PropertyEvent {
  const UpdateProperty(this.property);
  final PropertyModel property;
}
