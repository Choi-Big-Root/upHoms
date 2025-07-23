import 'package:freezed_annotation/freezed_annotation.dart';

import '../amenity/amenity_dto.dart';
import '../user/user_dto.dart';

part 'property_dto.freezed.dart';

part 'property_dto.g.dart';

@freezed
abstract class PropertyDto with _$PropertyDto {
  const factory PropertyDto({
    @Default(-1) int propertyId,
    @Default('') String propertyName,
    @Default('') String propertyDescription,
    @Default('') String mainImage,
    @Default('') String propertyLocation,
    @Default('') String propertyAddress,
    @Default(false) bool isDraft,
    @Default(UserDto()) UserDto user,
    @Default(AmenityDto()) AmenityDto amenity,
    @Default('') String propertyNeighborhood,
    @Default(0.0) double ratingSummary,
    @Default(-1) int price,
    @Default(0.0) double taxRate,
    @Default(-1) int cleaningFee,
    @Default('') String notes,
    @Default(-1) int minNightStay,
    @Default('') String lastUpdated,
    @Default(-1) int minNights,
    @Default(true) bool isLive,
  }) = _PropertyDto;

  factory PropertyDto.fromJson(Map<String, dynamic> json) =>
      _$PropertyDtoFromJson(json);
}
