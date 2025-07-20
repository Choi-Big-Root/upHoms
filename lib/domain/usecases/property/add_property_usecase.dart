import '../../model/property/property_model.dart';
import '../../repositories/property/property_repository.dart';

class AddPropertyUsecase{
  AddPropertyUsecase(this.propertyRepository);
  final PropertyRepository propertyRepository;

  Future<void> call (PropertyModel property) async {
    await propertyRepository.addProperty(property);
  }
}