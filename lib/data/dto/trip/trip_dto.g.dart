// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TripDto _$TripDtoFromJson(Map<String, dynamic> json) => _TripDto(
  tripId: (json['tripId'] as num?)?.toInt() ?? -1,
  propertyId: (json['propertyId'] as num?)?.toInt() ?? -1,
  userId: (json['userId'] as num?)?.toInt() ?? -1,
  property: json['property'] == null
      ? const PropertyDto()
      : PropertyDto.fromJson(json['property'] as Map<String, dynamic>),
  user: json['user'] == null
      ? const UserDto()
      : UserDto.fromJson(json['user'] as Map<String, dynamic>),
  tripBeginDate: json['tripBeginDate'] as String? ?? '',
  tripEndDate: json['tripEndDate'] as String? ?? '',
  tripCost: (json['tripCost'] as num?)?.toDouble() ?? 0.0,
  guests: (json['guests'] as num?)?.toInt() ?? -1,
  paymentMethod: json['paymentMethod'] as String? ?? '',
  tripCreated: json['tripCreated'] as String? ?? '',
  hostId: json['hostId'] ?? -1,
  host: json['host'] == null
      ? const UserDto()
      : UserDto.fromJson(json['host'] as Map<String, dynamic>),
  cancelTrip: json['cancelTrip'] as bool? ?? false,
  cancelReason: json['cancelReason'] as String? ?? '',
  tripTotal: (json['tripTotal'] as num?)?.toInt() ?? -1,
  upcoming: json['upcoming'] as bool? ?? false,
  complete: json['complete'] as bool? ?? false,
  rated: json['rated'] as bool? ?? false,
);

Map<String, dynamic> _$TripDtoToJson(_TripDto instance) => <String, dynamic>{
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
