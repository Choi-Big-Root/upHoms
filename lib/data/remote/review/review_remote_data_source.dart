import '../../../domain/model/review/review_model.dart';

abstract class ReviewRemoteDataSource {
  Future<List<ReviewModel>> getReviews(Map<String,dynamic> propertyId);
  Future<void> addReview(ReviewModel review);
}