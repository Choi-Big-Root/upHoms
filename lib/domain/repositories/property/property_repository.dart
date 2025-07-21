import '../../model/property/property_model.dart';

abstract class PropertyRepository{
  Future<void> addProperty(PropertyModel property);
  Future<List<PropertyModel>> getAllProperties(); // 추가
}