
import 'package:freezed_annotation/freezed_annotation.dart';
import '../user/user_model.dart';

part 'property_model.freezed.dart';
part 'property_model.g.dart';

@freezed
abstract class PropertyModel with _$PropertyModel {
  const factory PropertyModel({
    required String propertyName,
    required String propertyDescription,
    required String mainImage,
    required String propertyAddress,
    required bool isDraft,
    required UserModel userRef,
    required String propertyNeighborhood,
    required double ratingSummary,
    required int price,
    required double taxRate,
    required int cleaningFee,
    required String notes,
    required double minNightStay,
    required String lastUpdated,
    required int minNights,
    required bool isLive,
  }) = _PropertyModel;

  factory PropertyModel.fromJson(Map<String, dynamic> json) => _$PropertyModelFromJson(json);
}