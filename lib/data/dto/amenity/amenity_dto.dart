import 'package:freezed_annotation/freezed_annotation.dart';


part 'amenity_dto.freezed.dart';
part 'amenity_dto.g.dart';


@freezed
abstract class AmenityDto with _$AmenityDto {
  const factory AmenityDto({
    @Default(false) bool ac,
    @Default(false) bool heater,
    @Default(false) bool pool,
    @Default(false) bool dogFriendly,
    @Default(false) bool washer,
    @Default(false) bool dryer,
    @Default(false) bool workOut,
    @Default(false) bool hip,
    @Default(false) bool nightLife,
    @Default(false) bool extraOutlets,
    @Default(false) bool evCharger,
}) = _AmenityDto;

  factory AmenityDto.fromJson(Map<String, dynamic> json) =>
      _$AmenityDtoFromJson(json);
}
