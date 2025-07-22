import '../../domain/model/review/review_model.dart';
import '../dto/review/review_dto.dart';

class ReviewMapper {
  static ReviewDto toDto(ReviewModel model){
    return ReviewDto(
      reviewId: model.reviewId ?? -1,
      propertyId: model.propertyId ?? -1,
      userUid: model.userUid ?? -1,
      rating: model.rating ?? 0.0,
      ratingDescription: model.ratingDescription ?? '',
      ratingCreated: model.ratingCreated ?? '',
    );
  }

  static ReviewModel toModel(ReviewDto dto) {
    return ReviewModel(
      reviewId: dto.reviewId,
      propertyId: dto.propertyId,
      userUid: dto.userUid,
      rating: dto.rating,
      ratingDescription: dto.ratingDescription,
      ratingCreated: dto.ratingCreated,
    );
  }
}