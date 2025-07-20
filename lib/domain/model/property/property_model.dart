import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/dto/user/user_dto.dart';

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
    UserDto? user,
    String? propertyNeighborhood,
    double? ratingSummary,
    int? price,
    double? taxRate,
    int? cleaningFee,
    String? notes,
    double? minNightStay,
    String? lastUpdated,
    int? minNights,
    bool? isLive,
  }) = _PropertyModel;

  factory PropertyModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyModelFromJson(json);
}
