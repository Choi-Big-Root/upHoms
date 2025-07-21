import '../../../domain/model/property/property_model.dart';

abstract class PropertyRemoteDataSource {
  Future<void> addProperty(PropertyModel property);
  Future<List<PropertyModel>> getAllProperties(); // 추가
}