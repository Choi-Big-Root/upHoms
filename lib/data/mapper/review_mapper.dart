import '../../domain/model/review/review_model.dart';
import '../../domain/model/user/user_model.dart';
import '../dto/review/review_dto.dart';
import 'user_mapper.dart';

class ReviewMapper {
  static ReviewDto toDto(ReviewModel model){
    return ReviewDto(
      reviewId: model.reviewId ?? -1,
      propertyId: model.propertyId ?? -1,
      user: UserMapper.toDto(model.user ?? const UserModel()),
      rating: model.rating ?? 0.0,
      ratingDescription: model.ratingDescription ?? '',
      ratingCreated: model.ratingCreated ?? '',
    );
  }

  static ReviewModel toModel(ReviewDto dto) {
    return ReviewModel(
      reviewId: dto.reviewId,
      propertyId: dto.propertyId,
      user: UserMapper.toModel(dto.user),
      rating: dto.rating,
      ratingDescription: dto.ratingDescription,
      ratingCreated: dto.ratingCreated,
    );
  }
}