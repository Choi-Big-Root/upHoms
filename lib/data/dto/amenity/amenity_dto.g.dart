// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amenity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AmenityDto _$AmenityDtoFromJson(Map<String, dynamic> json) => _AmenityDto(
  ac: json['ac'] as bool? ?? false,
  heater: json['heater'] as bool? ?? false,
  pool: json['pool'] as bool? ?? false,
  dogFriendly: json['dogFriendly'] as bool? ?? false,
  washer: json['washer'] as bool? ?? false,
  dryer: json['dryer'] as bool? ?? false,
  workOut: json['workOut'] as bool? ?? false,
  hip: json['hip'] as bool? ?? false,
  nightLife: json['nightLife'] as bool? ?? false,
  extraOutlets: json['extraOutlets'] as bool? ?? false,
  evCharger: json['evCharger'] as bool? ?? false,
);

Map<String, dynamic> _$AmenityDtoToJson(_AmenityDto instance) =>
    <String, dynamic>{
      'ac': instance.ac,
      'heater': instance.heater,
      'pool': instance.pool,
      'dogFriendly': instance.dogFriendly,
      'washer': instance.washer,
      'dryer': instance.dryer,
      'workOut': instance.workOut,
      'hip': instance.hip,
      'nightLife': instance.nightLife,
      'extraOutlets': instance.extraOutlets,
      'evCharger': instance.evCharger,
    };
