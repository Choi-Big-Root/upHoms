import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user_dto.dart';

part 'review_dto.freezed.dart';

part 'review_dto.g.dart';

@freezed
abstract class ReviewDto with _$ReviewDto {
  const factory ReviewDto({
    @Default(-1) int reviewId,
    @Default(-1) int propertyId,
    @Default(UserDto()) UserDto user,
    @Default(0.0) double rating,
    @Default('') String ratingDescription,
    @Default('') String ratingCreated,
  }) = _ReviewDto;

  factory ReviewDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewDtoFromJson(json);
}
