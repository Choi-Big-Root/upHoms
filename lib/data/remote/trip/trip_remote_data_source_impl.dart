import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../domain/model/trip/trip_model.dart';
import '../../mapper/trip_mapper.dart';
import 'trip_api_service.dart';
import 'trip_remote_data_source.dart';

class TripRemoteDataSourceImpl implements TripRemoteDataSource {
  TripRemoteDataSourceImpl(this.tripApiService);

  final TripApiService tripApiService;

  final logger = Logger();

  @override
  Future<void> addTrip(TripModel trip) async {
    try {
      final tripDto = TripMapper.toDto(trip);
      await tripApiService.addTrip(tripDto);
    }on DioException catch (e) {
      // DioException을 사용하여 더 상세한 에러 처리
      if (e.response != null) {
        logger.e('Error Add trip: ${e.response?.statusCode} - ${e.response?.data}');
        throw Exception('${e.response?.data}');
      } else {
        logger.e('Error Add trip: ${e.message}');
        throw Exception('Failed to create user: Network error or timeout');
      }
    } catch (e) {
      logger.e('Unexpected error Add trip: $e');
      throw Exception('An unexpected error occurred while Add trip');
    }
  }

}