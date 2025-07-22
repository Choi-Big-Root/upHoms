// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewDto _$ReviewDtoFromJson(Map<String, dynamic> json) => _ReviewDto(
  reviewId: (json['reviewId'] as num?)?.toInt() ?? -1,
  propertyId: (json['propertyId'] as num?)?.toInt() ?? -1,
  user: json['user'] == null
      ? const UserDto()
      : UserDto.fromJson(json['user'] as Map<String, dynamic>),
  rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
  ratingDescription: json['ratingDescription'] as String? ?? '',
  ratingCreated: json['ratingCreated'] as String? ?? '',
);

Map<String, dynamic> _$ReviewDtoToJson(_ReviewDto instance) =>
    <String, dynamic>{
      'reviewId': instance.reviewId,
      'propertyId': instance.propertyId,
      'user': instance.user,
      'rating': instance.rating,
      'ratingDescription': instance.ratingDescription,
      'ratingCreated': instance.ratingCreated,
    };
