// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TripModel _$TripModelFromJson(Map<String, dynamic> json) => _TripModel(
  tripId: (json['tripId'] as num?)?.toInt(),
  propertyId: (json['propertyId'] as num?)?.toInt(),
  userId: (json['userId'] as num?)?.toInt(),
  property: json['property'] == null
      ? null
      : PropertyModel.fromJson(json['property'] as Map<String, dynamic>),
  user: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
  tripBeginDate: json['tripBeginDate'] as String?,
  tripEndDate: json['tripEndDate'] as String?,
  tripCost: (json['tripCost'] as num?)?.toDouble(),
  guests: (json['guests'] as num?)?.toInt(),
  paymentMethod: json['paymentMethod'] as String?,
  tripCreated: json['tripCreated'] as String?,
  hostId: (json['hostId'] as num?)?.toInt(),
  host: json['host'] == null
      ? null
      : UserModel.fromJson(json['host'] as Map<String, dynamic>),
  cancelTrip: json['cancelTrip'] as bool?,
  cancelReason: json['cancelReason'] as String?,
  tripTotal: (json['tripTotal'] as num?)?.toInt(),
  upcoming: json['upcoming'] as bool?,
  complete: json['complete'] as bool?,
  rated: json['rated'] as bool?,
);

Map<String, dynamic> _$TripModelToJson(_TripModel instance) =>
    <String, dynamic>{
      'tripId': instance.tripId,
      'propertyId': instance.propertyId,
      'userId': instance.userId,
      'property': instance.property,
      'user': instance.user,
      'tripBeginDate': instance.tripBeginDate,
      'tripEndDate': instance.tripEndDate,
      'tripCost': instance.tripCost,
      'guests': instance.guests,
      'paymentMethod': instance.paymentMethod,
      'tripCreated': instance.tripCreated,
      'hostId': instance.hostId,
      'host': instance.host,
      'cancelTrip': instance.cancelTrip,
      'cancelReason': instance.cancelReason,
      'tripTotal': instance.tripTotal,
      'upcoming': instance.upcoming,
      'complete': instance.complete,
      'rated': instance.rated,
    };
