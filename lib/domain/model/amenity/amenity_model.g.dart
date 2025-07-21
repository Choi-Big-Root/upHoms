// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amenity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AmenityModel _$AmenityModelFromJson(Map<String, dynamic> json) =>
    _AmenityModel(
      ac: json['ac'] as bool?,
      heater: json['heater'] as bool?,
      pool: json['pool'] as bool?,
      dogFriendly: json['dogFriendly'] as bool?,
      washer: json['washer'] as bool?,
      dryer: json['dryer'] as bool?,
      workOut: json['workOut'] as bool?,
      hip: json['hip'] as bool?,
      nightLife: json['nightLife'] as bool?,
      extraOutlets: json['extraOutlets'] as bool?,
      evCharger: json['evCharger'] as bool?,
    );

Map<String, dynamic> _$AmenityModelToJson(_AmenityModel instance) =>
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
