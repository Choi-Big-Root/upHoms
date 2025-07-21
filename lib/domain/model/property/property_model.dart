import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/dto/amenity/amenity_dto.dart';
import '../../../data/dto/user/user_dto.dart';
import '../amenity/amenity_model.dart';
import '../user/user_model.dart';

part 'property_model.freezed.dart';
part 'property_model.g.dart';


@freezed
abstract class PropertyModel with _$PropertyModel {
  const factory PropertyModel({
    String? propertyId,
    String? propertyName,
    String? propertyDescription,
    String? mainImage,
    String? propertyLocation,
    String? propertyAddress,
    bool? isDraft,
    UserModel? user,
    AmenityModel? amenity,
    String? propertyNeighborhood,
    double? ratingSummary,
    int? price,
    double? taxRate,
    int? cleaningFee,
    String? notes,
    int? minNightStay,
    String? lastUpdated,
    int? minNights,
    bool? isLive,
  }) = _PropertyModel;

  factory PropertyModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyModelFromJson(json);
}
