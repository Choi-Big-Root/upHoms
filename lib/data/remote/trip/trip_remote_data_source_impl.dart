import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../domain/model/trip/trip_model.dart';
import '../../dto/trip/trip_dto.dart';
import '../../mapper/trip_mapper.dart';
import 'trip_api_service.dart';
import 'trip_remote_data_source.dart';

class TripRemoteDataSourceImpl implements TripRemoteDataSource {
  TripRemoteDataSourceImpl(this.tripApiService);

  final TripApiService tripApiService;

  final logger = Logger();

  @override
  Future<TripModel> addTrip(TripModel trip) async {
    try {
      final TripDto requestDto = TripMapper.toDto(trip);
      final TripDto responseDto = await tripApiService.addTrip(requestDto);
      return TripMapper.toModel(responseDto);
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

  @override
  Future<TripModel> getTrip(Map<String, dynamic> tripId) async {
    try {
      final TripDto responseDto = await tripApiService.getTrip(tripId);
      return TripMapper.toModel(responseDto);
    }on DioException catch (e) {
      // DioException을 사용하여 더 상세한 에러 처리
      if (e.response != null) {
        logger.e('Error getTrip: ${e.response?.statusCode} - ${e.response?.data}');
        throw Exception('${e.response?.data}');
      } else {
        logger.e('Error getTrip: ${e.message}');
        throw Exception('Failed to getTrip: Network error or timeout');
      }
    } catch (e) {
      logger.e('Unexpected error getTrip: $e');
      throw Exception('An unexpected error occurred while getTrip');
    }
  }

  @override
  Future<List<TripModel>> getTripsWithUser(Map<String, dynamic> userId) async {
    try{
      final tripDtos = await tripApiService.getTripsWithUser(userId);
      logger.d(tripDtos.toString());
      return tripDtos.map((dto) => TripMapper.toModel(dto)).toList();
    }on DioException catch (e) {
      if (e.response != null) {
        logger.e('Error Get getTripsWithUser: ${e.response?.statusCode} - ${e.response?.data}');
        throw Exception('${e.response?.data}');
      } else {
        logger.e('Error Get getTripsWithUser: ${e.message}');
        throw Exception('Failed to get getTripsWithUser: Network error or timeout');
      }
    } catch (e) {
      logger.e('Unexpected error Get getTripsWithUser: $e');
      throw Exception('An unexpected error occurred while getting getTripsWithUser');
    }
  }

}