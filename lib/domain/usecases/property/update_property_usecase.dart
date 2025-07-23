import '../../model/property/property_model.dart';
import '../../repositories/property/property_repository.dart';

class UpdatePropertyUsecase{
  UpdatePropertyUsecase(this.propertyRepository);
  final PropertyRepository propertyRepository;

  Future<void> call (PropertyModel property) async {
    await propertyRepository.updateProperty(property);
  }
}