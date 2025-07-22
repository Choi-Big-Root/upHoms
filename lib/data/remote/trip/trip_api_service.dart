import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';
import '../../dto/trip/trip_dto.dart';

part 'trip_api_service.g.dart';

@RestApi()
abstract class TripApiService {
  factory TripApiService(Dio dio, {String baseUrl}) = _TripApiService;

  @POST('/add_trip')
  Future<void> addTrip(@Body() TripDto trip);
}
