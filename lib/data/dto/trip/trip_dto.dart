import 'package:freezed_annotation/freezed_annotation.dart';

import '../property/property_dto.dart';
import '../user/user_dto.dart';

part 'trip_dto.freezed.dart';

part 'trip_dto.g.dart';

@freezed
abstract class TripDto with _$TripDto {
  const factory TripDto({
    @Default(-1) int tripId,
    @Default(-1) int propertyId,
    @Default(-1) int userId,
    @Default(PropertyDto()) PropertyDto property,
    @Default(UserDto()) UserDto user,
    @Default('') String tripBeginDate,
    @Default('') String tripEndDate,
    @Default(0.0) double tripCost,
    @Default(-1) int guests,
    @Default('') String paymentMethod,
    @Default('') String tripCreated,
    @Default(-1) hostId,
    @Default(UserDto()) UserDto host,
    @Default(false) bool cancelTrip,
    @Default('') String cancelReason,
    @Default(-1) int tripTotal,
    @Default(false) bool upcoming,
    @Default(false) bool rated,
  }) = _TripDto;

  factory TripDto.fromJson(Map<String, dynamic> json) =>
      _$TripDtoFromJson(json);
}
