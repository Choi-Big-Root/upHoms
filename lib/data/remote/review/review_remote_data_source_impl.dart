import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../domain/model/review/review_model.dart';
import '../../mapper/review_mapper.dart';
import 'review_api_service.dart';
import 'review_remote_data_source.dart';

class ReviewRemoteDataSourceImpl implements ReviewRemoteDataSource {
  ReviewRemoteDataSourceImpl(this.reviewApiService);

  final ReviewApiService reviewApiService;

  final logger = Logger();

  @override
  Future<List<ReviewModel>> getReviews(Map<String, dynamic> propertyId) async {
    try{
      final reviewsDtos = await reviewApiService.getReviews(propertyId);
      return reviewsDtos.map((dto) => ReviewMapper.toModel(dto)).toList();
    } on DioException catch (e) {
      if (e.response != null) {
        logger.e('Error getReviews: ${e.response?.statusCode} - ${e.response?.data}');
        throw Exception('${e.response?.data}');
      } else {
        logger.e('Error getReviews: ${e.message}');
        throw Exception('Failed to create user: Network error or timeout');
      }
    } catch (e) {
      logger.e('Unexpected error getReviews:: $e');
      throw Exception('An unexpected error occurred while getReviews');
    }
  }
}
