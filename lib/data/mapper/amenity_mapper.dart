import '../../domain/model/amenity/amenity_model.dart';
import '../dto/amenity/amenity_dto.dart';

class AmenityMapper {
  static AmenityDto toDto(AmenityModel model) {
    return AmenityDto(
      ac: model.ac ?? false,
      heater: model.heater ?? false,
      pool: model.pool ?? false,
      dogFriendly: model.dogFriendly ?? false,
      washer: model.washer ?? false,
      dryer: model.dryer ?? false,
      workOut: model.workOut ?? false,
      hip: model.hip ?? false,
      nightLife: model.nightLife ?? false,
      extraOutlets: model.extraOutlets ?? false,
      evCharger: model.evCharger ?? false,
    );
  }


  static AmenityModel toModel(AmenityDto dto) {
    return AmenityModel(
      ac: dto.ac,
      heater: dto.heater,
      pool: dto.pool,
      dogFriendly: dto.dogFriendly,
      washer: dto.washer,
      dryer: dto.dryer,
      workOut: dto.workOut,
      hip: dto.hip,
      nightLife: dto.nightLife,
      extraOutlets: dto.extraOutlets,
      evCharger: dto.evCharger,
    );
  }
}