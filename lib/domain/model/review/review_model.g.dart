// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => _ReviewModel(
  reviewId: (json['reviewId'] as num?)?.toInt(),
  tripId: (json['tripId'] as num?)?.toInt(),
  propertyId: (json['propertyId'] as num?)?.toInt(),
  user: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
  rating: (json['rating'] as num?)?.toDouble(),
  ratingDescription: json['ratingDescription'] as String?,
  ratingCreated: json['ratingCreated'] as String?,
);

Map<String, dynamic> _$ReviewModelToJson(_ReviewModel instance) =>
    <String, dynamic>{
      'reviewId': instance.reviewId,
      'tripId': instance.tripId,
      'propertyId': instance.propertyId,
      'user': instance.user,
      'rating': instance.rating,
      'ratingDescription': instance.ratingDescription,
      'ratingCreated': instance.ratingCreated,
    };
