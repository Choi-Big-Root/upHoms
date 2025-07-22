// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => _ReviewModel(
  reviewId: (json['reviewId'] as num?)?.toInt(),
  propertyId: (json['propertyId'] as num?)?.toInt(),
  userUid: (json['userUid'] as num?)?.toInt(),
  rating: (json['rating'] as num?)?.toDouble(),
  ratingDescription: json['ratingDescription'] as String?,
  ratingCreated: json['ratingCreated'] as String?,
);

Map<String, dynamic> _$ReviewModelToJson(_ReviewModel instance) =>
    <String, dynamic>{
      'reviewId': instance.reviewId,
      'propertyId': instance.propertyId,
      'userUid': instance.userUid,
      'rating': instance.rating,
      'ratingDescription': instance.ratingDescription,
      'ratingCreated': instance.ratingCreated,
    };
