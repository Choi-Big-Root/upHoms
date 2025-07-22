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

  @override
  Future<List<PropertyModel>> getAllProperties() async {
    try {
      final propertyDtos = await propertyApiService.getAllProperties();
      return propertyDtos.map((dto) => PropertyMapper.toModel(dto)).toList();
    } on DioException catch (e) {
      if (e.response != null) {
        logger.e('Error Get All Properties: ${e.response?.statusCode} - ${e.response?.data}');
        throw Exception('${e.response?.data}');
      } else {
        logger.e('Error Get All Properties: ${e.message}');
        throw Exception('Failed to get all properties: Network error or timeout');
      }
    } catch (e) {
      logger.e('Unexpected error Get All Properties: $e');
      throw Exception('An unexpected error occurred while getting all properties');
    }
  }

  @override
  Future<List<PropertyModel>> getSearchProperties(Map<String, dynamic> searchText) async {
    try{
      final propertyDtos = await propertyApiService.getSearchProperties(searchText);
      return propertyDtos.map((dto) => PropertyMapper.toModel(dto)).toList();
    }on DioException catch (e) {
      if (e.response != null) {
        logger.e('Error Get search Properties: ${e.response?.statusCode} - ${e.response?.data}');
        throw Exception('${e.response?.data}');
      } else {
        logger.e('Error Get search Properties: ${e.message}');
        throw Exception('Failed to get search properties: Network error or timeout');
      }
    } catch (e) {
      logger.e('Unexpected error Get search Properties: $e');
      throw Exception('An unexpected error occurred while getting search properties');
    }
  }

  @override
  Future<PropertyModel> getProperty(Map<String, dynamic> propertyId) async {
    try{
      final propertyDto = await propertyApiService.getProperty(propertyId);
      return PropertyMapper.toModel(propertyDto);
    }on DioException catch (e) {
      if (e.response != null) {
        logger.e('Error getProperty: ${e.response?.statusCode} - ${e.response?.data}');
        throw Exception('${e.response?.data}');
      } else {
        logger.e('Error getProperty: ${e.message}');
        throw Exception('Failed to getProperty: Network error or timeout');
      }
    } catch (e) {
      logger.e('Unexpected error getProperty: $e');
      throw Exception('An unexpected error occurred while getting search properties');
    }
  }
}