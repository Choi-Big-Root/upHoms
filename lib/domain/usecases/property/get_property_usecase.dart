import '../../model/property/property_model.dart';
import '../../repositories/property/property_repository.dart';

class GetPropertyUsecase {

  GetPropertyUsecase(this.propertyRepository);
  final PropertyRepository propertyRepository;

  Future<PropertyModel> call (Map<String,dynamic> propertyId) async {
    return await propertyRepository.getProperty(propertyId);
  }
}