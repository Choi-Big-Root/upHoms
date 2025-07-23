import '../../model/review/review_model.dart';
import '../../repositories/review/review_repository.dart';

class AddReviewUsecase {

  AddReviewUsecase(this.reviewRepository);
  final ReviewRepository reviewRepository;

  Future<void> call (ReviewModel review) async {
    await reviewRepository.addReview(review);
  }
}