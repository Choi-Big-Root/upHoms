import '../../../domain/model/property/property_model.dart';

abstract class PropertyRemoteDataSource {
  Future<void> addProperty(PropertyModel property);
  Future<List<PropertyModel>> getAllProperties(); // 추가
  Future<List<PropertyModel>> getSearchProperties(Map<String, dynamic> searchText);
  Future<PropertyModel> getProperty(Map<String, dynamic> propertyId);
}