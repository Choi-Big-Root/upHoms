import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';
import '../../dto/property/property_dto.dart';

part 'property_api_service.g.dart';

@RestApi()
abstract class PropertyApiService {
  factory PropertyApiService(Dio dio, {String baseUrl}) = _PropertyApiService;

  @POST('/add_property')
  Future<void> addProperty(@Body() PropertyDto property);
}