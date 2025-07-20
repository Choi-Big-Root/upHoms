// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PropertyModel _$PropertyModelFromJson(Map<String, dynamic> json) =>
    _PropertyModel(
      propertyName: json['propertyName'] as String?,
      propertyDescription: json['propertyDescription'] as String?,
      mainImage: json['mainImage'] as String?,
      propertyLocation: json['propertyLocation'] as String?,
      propertyAddress: json['propertyAddress'] as String?,
      isDraft: json['isDraft'] as bool?,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
      propertyNeighborhood: json['propertyNeighborhood'] as String?,
      ratingSummary: (json['ratingSummary'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toInt(),
      taxRate: (json['taxRate'] as num?)?.toDouble(),
      cleaningFee: (json['cleaningFee'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      minNightStay: (json['minNightStay'] as num?)?.toDouble(),
      lastUpdated: json['lastUpdated'] as String?,
      minNights: (json['minNights'] as num?)?.toInt(),
      isLive: json['isLive'] as bool?,
    );

Map<String, dynamic> _$PropertyModelToJson(_PropertyModel instance) =>
    <String, dynamic>{
      'propertyName': instance.propertyName,
      'propertyDescription': instance.propertyDescription,
      'mainImage': instance.mainImage,
      'propertyLocation': instance.propertyLocation,
      'propertyAddress': instance.propertyAddress,
      'isDraft': instance.isDraft,
      'user': instance.user,
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
