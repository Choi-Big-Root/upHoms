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

  @GET('/properties') // 모든 속성을 가져오는 GET 요청 추가
  Future<List<PropertyDto>> getAllProperties();

  @POST('/property_search')
  Future<List<PropertyDto>> getSearchProperties(@Body() Map<String, dynamic> searchText);

  @POST('/get_property')
  Future<PropertyDto> getProperty(@Body() Map<String,dynamic> propertyId);
}