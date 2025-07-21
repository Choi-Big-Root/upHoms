import '../../model/property/property_model.dart';
import '../../repositories/property/property_repository.dart';

class GetAllPropertiesUsecase {
  final PropertyRepository propertyRepository;

  GetAllPropertiesUsecase(this.propertyRepository);

  Future<List<PropertyModel>> call() async {
    return await propertyRepository.getAllProperties();
  }
}