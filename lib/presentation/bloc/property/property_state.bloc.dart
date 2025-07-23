part of 'property_bloc.bloc.dart';

@freezed
class PropertyState with _$PropertyState {
  const factory PropertyState.initial() = Initial;
  const factory PropertyState.loading() = Loading;
  const factory PropertyState.success() = Created;
  const factory PropertyState.error(String message) = Error;
  const factory PropertyState.editing(PropertyModel property) = Editing;
  const factory PropertyState.propertiesLoaded(List<PropertyModel> properties) = PropertiesLoaded;
  const factory PropertyState.searchPropertiesLoaded(List<PropertyModel> properties) = SearchPropertiesLoaded;
  const factory PropertyState.propertyLoaded(PropertyModel property) = PropertyLoaded;
  const factory PropertyState.updateSuccess(PropertyModel property) = UpdateSuccess;

}