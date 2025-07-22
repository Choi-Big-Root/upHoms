import '../../model/review/review_model.dart';

abstract class ReviewRepository {
  Future<List<ReviewModel>> getReviews(Map<String,dynamic> propertyId);
}