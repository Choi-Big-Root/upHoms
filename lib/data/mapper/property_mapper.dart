import '../../domain/model/amenity/amenity_model.dart';
import '../../domain/model/property/property_model.dart';
import '../../domain/model/user/user_model.dart';
import '../dto/amenity/amenity_dto.dart';
import '../dto/property/property_dto.dart';
import '../dto/user/user_dto.dart';
import 'amenity_mapper.dart';
import 'user_mapper.dart';

class PropertyMapper {
  static PropertyDto toDto(PropertyModel model) {
    return PropertyDto(
      propertyId : model.propertyId ?? -1,
      propertyName: model.propertyName ?? '',
      propertyDescription: model.propertyDescription ?? '',
      mainImage: model.mainImage ?? '',
      propertyLocation: model.propertyLocation ?? '',
      propertyAddress: model.propertyAddress ?? '',
      isDraft: model.isDraft ?? false,
      user: UserMapper.toDto(model.user ?? const UserModel()),
      amenity: AmenityMapper.toDto(model.amenity ?? const AmenityModel()),
      propertyNeighborhood: model.propertyNeighborhood ?? '',
      ratingSummary: model.ratingSummary ?? 0.0,
      price: model.price ?? -1,
      taxRate: model.taxRate ?? 0.0,
      cleaningFee: model.cleaningFee ?? -1,
      notes: model.notes ?? '',
      minNightStay: model.minNightStay ?? -1,
      lastUpdated: model.lastUpdated ?? '',
      minNights: model.minNights ?? -1,
      isLive: model.isLive ?? true,
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
      user: UserMapper.toModel(dto.user) ,
      amenity: AmenityMapper.toModel(dto.amenity),
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
