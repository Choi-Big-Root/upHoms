import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

import '../../dto/review/review_dto.dart';

part 'review_api_service.g.dart';


@RestApi()
abstract class ReviewApiService {
  factory ReviewApiService(Dio dio,{String baseUrl}) = _ReviewApiService;

  @POST('/get_reviews')
  Future<List<ReviewDto>> getReviews(@Body() Map<String,dynamic> propertyId);

  @POST('/add_review')
  Future<void> addReview(@Body() ReviewDto review);
}