import '../../domain/model/property/property_model.dart';
import '../../domain/model/user/user_model.dart';
import '../dto/property/property_dto.dart';
import '../dto/user/user_dto.dart';

class PropertyMapper {
  static PropertyDto toDto(PropertyModel model) {
    return PropertyDto(
      propertyId : model.propertyId ?? '',
      propertyName: model.propertyName ?? '',
      propertyDescription: model.propertyDescription ?? '',
      mainImage: model.mainImage ?? '',
      propertyLocation: model.propertyLocation ?? '',
      propertyAddress: model.propertyAddress ?? '',
      isDraft: model.isDraft ?? false,
      user: model.user ?? const UserDto(),
      propertyNeighborhood: model.propertyNeighborhood ?? '',
      ratingSummary: model.ratingSummary ?? 0.0,
      price: model.price ?? -1,
      taxRate: model.taxRate ?? 0.0,
      cleaningFee: model.cleaningFee ?? -1,
      notes: model.notes ?? '',
      minNightStay: model.minNightStay ?? 0.0,
      lastUpdated: model.lastUpdated ?? '',
      minNights: model.minNights ?? -1,
      isLive: model.isLive ?? false,
    );
  }
  static PropertyModel toModel(PropertyDto dto) {
    return PropertyModel(
      propertyId: dto.propertyId,
      propertyName: dto.propertyName,
      propertyDescription: dto.propertyDescription,
      mainImage: dto.mainImage,
      propertyLocation: dto.propertyLocation ,
      propertyAddress: dto.propertyAddress ,
      isDraft: dto.isDraft,
      user: dto.user ,
      propertyNeighborhood: dto.propertyNeighborhood ,
      ratingSummary: dto.ratingSummary ,
      price: dto.price ,
      taxRate: dto.taxRate ,
      cleaningFee: dto.cleaningFee ,
      notes: dto.notes ,
      minNightStay: dto.minNightStay ,
      lastUpdated: dto.lastUpdated ,
      minNights: dto.minNights,
      isLive: dto.isLive ,
    );
  }
}
