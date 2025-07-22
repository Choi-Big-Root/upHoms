import 'package:freezed_annotation/freezed_annotation.dart';

import '../property/property_model.dart';
import '../user/user_model.dart';

part 'trip_model.freezed.dart';
part 'trip_model.g.dart';


@freezed
abstract class TripModel with _$TripModel {
  const factory TripModel({
    int? tripId,
    int? propertyId,
    int? userId,
    PropertyModel? property,
    UserModel? user,
    String? tripBeginDate,
    String? tripEndDate,
    double? tripCost,
    int? guests,
    String? paymentMethod,
    String? tripCreated,
    int? hostId,
    UserModel? host,
    bool? cancelTrip,
    String? cancelReason,
    int? tripTotal,
    bool? upcoming,
    bool? complete,
    bool? rated,
}) = _TripModel;

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);
}
