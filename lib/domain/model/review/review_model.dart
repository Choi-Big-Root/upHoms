import 'package:freezed_annotation/freezed_annotation.dart';


part 'review_model.freezed.dart';
part 'review_model.g.dart';


@freezed
abstract class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    int? reviewId,
    int? propertyId,
    int? userUid,
    double? rating,
    String? ratingDescription,
    String? ratingCreated,
}) = _ReviewModel;
  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}
