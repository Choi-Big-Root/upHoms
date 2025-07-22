import '../../model/review/review_model.dart';
import '../../repositories/review/review_repository.dart';

class GetReviewsUsecase {

  GetReviewsUsecase(this.reviewRepository);
  final ReviewRepository reviewRepository;

  Future<List<ReviewModel>> call (Map<String,dynamic> propertyId) async {
    return await reviewRepository.getReviews(propertyId);
  }
}