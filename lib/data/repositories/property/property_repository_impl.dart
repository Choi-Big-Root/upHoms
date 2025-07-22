import '../../../domain/model/property/property_model.dart';
import '../../../domain/repositories/property/property_repository.dart';
import '../../remote/property/property_remote_data_source.dart';

class PropertyRepositoryImpl implements PropertyRepository {
  PropertyRepositoryImpl(this.propertyRemoteDataSource);
  final PropertyRemoteDataSource propertyRemoteDataSource;

  @override
  Future<void> addProperty(PropertyModel property) async {
    await propertyRemoteDataSource.addProperty(property);
  }

  @override
  Future<List<PropertyModel>> getAllProperties() async {
    return await propertyRemoteDataSource.getAllProperties();
  }

  @override
  Future<List<PropertyModel>> getSearchProperties(Map<String, dynamic> searchText) async {
    return await propertyRemoteDataSource.getSearchProperties(searchText);
  }

  @override
  Future<PropertyModel> getProperty(Map<String, dynamic> propertyId) async {
    return await propertyRemoteDataSource.getProperty(propertyId);
  }
}