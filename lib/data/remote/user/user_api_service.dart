

import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../dto/user/user_dto.dart';

part 'user_api_service.g.dart';

@RestApi() //dio 에서 런타임 시점에서 선언하여 사용할것.
abstract class UserApiService {
  factory UserApiService(Dio dio, {String baseUrl}) = _UserApiService;

  @POST("/user_create")
  Future<void> createUser(@Body() UserDto user);

  @POST("/login")
  Future<UserDto> getUser(@Body() UserDto user);

  @POST("/user_update")
  Future<UserDto> updateUser(@Body() UserDto user);
}