import '../../model/property/property_model.dart';
import '../../repositories/property/property_repository.dart';

class GetSearchPropertiesUsecase {
  final PropertyRepository propertyRepository;

  GetSearchPropertiesUsecase(this.propertyRepository);

  Future<List<PropertyModel>> call(Map<String, dynamic> searchText) async {
    return await propertyRepository.getSearchProperties(searchText);
  }
}