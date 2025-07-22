import '../../../domain/model/review/review_model.dart';
import '../../../domain/repositories/review/review_repository.dart';
import '../../remote/review/review_remote_data_source.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  ReviewRepositoryImpl(this.reviewRemoteDataSource);

  final ReviewRemoteDataSource reviewRemoteDataSource;

  @override
  Future<List<ReviewModel>> getReviews(Map<String, dynamic> propertyId) async {
    return await reviewRemoteDataSource.getReviews(propertyId);
  }
}
