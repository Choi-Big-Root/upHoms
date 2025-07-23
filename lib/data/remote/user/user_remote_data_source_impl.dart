import 'package:dio/dio.dart'; // DioException 처리를 위해 필요
import '../../../domain/model/user/user_model.dart';
import '../../mapper/user_mapper.dart'; // Mapper 임포트
import './user_api_service.dart'; // UserApiService 임포트
import './user_remote_data_source.dart'; // UserRemoteDataSource 임포트
import 'package:logger/logger.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final UserApiService userApiService; // Retrofit 서비스 주입

  UserRemoteDataSourceImpl(this.userApiService);

  final logger = Logger();

  @override
  Future<void> createUser(UserModel user) async {
    try {
      final userDto = UserMapper.toDto(user); // UserModel을 UserDto로 변환
      await userApiService.createUser(userDto); // Retrofit 서비스를 통해 요청
    } on DioException catch (e) {
      // DioException을 사용하여 더 상세한 에러 처리
      if (e.response != null) {
        logger.e('Error creating user: ${e.response?.statusCode} - ${e.response?.data}');
        throw Exception('${e.response?.data}');
      } else {
        logger.e('Error creating user: ${e.message}');
        throw Exception('Failed to create user: Network error or timeout');
      }
    } catch (e) {
      logger.e('Unexpected error creating user: $e');
      throw Exception('An unexpected error occurred while creating user');
    }
  }

  @override
  Future<UserModel> getUser(UserModel user) async {
    try{
      final userDto = UserMapper.toDto(user);
      final responseDto = await userApiService.getUser(userDto);
      return UserMapper.toModel(responseDto);
    } on DioException catch (e) {
      // DioException을 사용하여 더 상세한 에러 처리
      if (e.response != null) {
        logger.e('Error getting user: ${e.response?.statusCode} - ${e.response?.data}');
        throw Exception('${e.response?.data}');
      } else {
        logger.e('Error getting user: ${e.message}');
        throw Exception('Failed to get user: Network error or timeout');
      }
    } catch (e) {
      logger.e('Unexpected error getting user: $e');
      throw Exception('An unexpected error occurred while getting user');
    }
  }

  @override
  Future<UserModel> updateUser(UserModel user) async {
    try{
      final userDto = UserMapper.toDto(user);
      final responseDto = await userApiService.updateUser(userDto);
      return UserMapper.toModel(responseDto);
    } on DioException catch (e) {
      // DioException을 사용하여 더 상세한 에러 처리
      if (e.response != null) {
        logger.e('Error updateUser user: ${e.response?.statusCode} - ${e.response?.data}');
        throw Exception('${e.response?.data}');
      } else {
        logger.e('Error updateUser user: ${e.message}');
        throw Exception('Failed to get user: Network error or timeout');
      }
    } catch (e) {
      logger.e('Unexpected error updateUser user: $e');
      throw Exception('An unexpected error occurred while updateUser user');
    }
  }


}