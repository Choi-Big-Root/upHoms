import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../domain/model/property/property_model.dart';
import '../../mapper/property_mapper.dart';
import 'property_api_service.dart';
import 'property_remote_data_source.dart';

class PropertyRemoteDataSourceImpl implements PropertyRemoteDataSource {
  PropertyRemoteDataSourceImpl(this.propertyApiService);

  final PropertyApiService propertyApiService;

  final logger = Logger();

  @override
  Future<void> addProperty(PropertyModel property) async {
    try {
      final propertyDto = PropertyMapper.toDto(property); // UserModel을 UserDto로 변환
      await propertyApiService.addProperty(propertyDto); // Retrofit 서비스를 통해 요청
    } on DioException catch (e) {
      // DioException을 사용하여 더 상세한 에러 처리
      if (e.response != null) {
        logger.e('Error Add Property: ${e.response?.statusCode} - ${e.response?.data}');
        throw Exception('${e.response?.data}');
      } else {
        logger.e('Error Add Property: ${e.message}');
        throw Exception('Failed to create user: Network error or timeout');
      }
    } catch (e) {
      logger.e('Unexpected error Add Property:: $e');
      throw Exception('An unexpected error occurred while Add Property');
    }
  }
}