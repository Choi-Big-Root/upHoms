import 'package:freezed_annotation/freezed_annotation.dart';

part 'amenity_model.freezed.dart';
part 'amenity_model.g.dart';

@freezed
abstract class AmenityModel with _$AmenityModel {
  const factory AmenityModel({
    bool? ac,
    bool? heater,
    bool? pool,
    bool? dogFriendly,
    bool? washer,
    bool? dryer,
    bool? workOut,
    bool? hip,
    bool? nightLife,
    bool? extraOutlets,
    bool? evCharger,

  }) = _AmenityModel;
  factory AmenityModel.fromJson(Map<String, dynamic> json) =>
      _$AmenityModelFromJson(json);
}
