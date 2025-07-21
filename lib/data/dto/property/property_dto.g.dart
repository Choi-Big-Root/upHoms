// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PropertyDto _$PropertyDtoFromJson(Map<String, dynamic> json) => _PropertyDto(
  propertyId: json['propertyId'] as String? ?? '',
  propertyName: json['propertyName'] as String? ?? '',
  propertyDescription: json['propertyDescription'] as String? ?? '',
  mainImage: json['mainImage'] as String? ?? '',
  propertyLocation: json['propertyLocation'] as String? ?? '',
  propertyAddress: json['propertyAddress'] as String? ?? '',
  isDraft: json['isDraft'] as bool? ?? false,
  user: json['user'] == null
      ? const UserDto()
      : UserDto.fromJson(json['user'] as Map<String, dynamic>),
  amenity: json['amenity'] == null
      ? const AmenityDto()
      : AmenityDto.fromJson(json['amenity'] as Map<String, dynamic>),
  propertyNeighborhood: json['propertyNeighborhood'] as String? ?? '',
  ratingSummary: (json['ratingSummary'] as num?)?.toDouble() ?? 0.0,
  price: (json['price'] as num?)?.toInt() ?? -1,
  taxRate: (json['taxRate'] as num?)?.toDouble() ?? 0.0,
  cleaningFee: (json['cleaningFee'] as num?)?.toInt() ?? -1,
  notes: json['notes'] as String? ?? '',
  minNightStay: (json['minNightStay'] as num?)?.toInt() ?? -1,
  lastUpdated: json['lastUpdated'] as String? ?? '',
  minNights: (json['minNights'] as num?)?.toInt() ?? -1,
  isLive: json['isLive'] as bool? ?? false,
);

Map<String, dynamic> _$PropertyDtoToJson(_PropertyDto instance) =>
    <String, dynamic>{
      'propertyId': instance.propertyId,
      'propertyName': instance.propertyName,
      'propertyDescription': instance.propertyDescription,
      'mainImage': instance.mainImage,
      'propertyLocation': instance.propertyLocation,
      'propertyAddress': instance.propertyAddress,
      'isDraft': instance.isDraft,
      'user': instance.user,
      'amenity': instance.amenity,
      'propertyNeighborhood': instance.propertyNeighborhood,
      'ratingSummary': instance.ratingSummary,
      'price': instance.price,
      'taxRate': instance.taxRate,
      'cleaningFee': instance.cleaningFee,
      'notes': instance.notes,
      'minNightStay': instance.minNightStay,
      'lastUpdated': instance.lastUpdated,
      'minNights': instance.minNights,
      'isLive': instance.isLive,
    };
