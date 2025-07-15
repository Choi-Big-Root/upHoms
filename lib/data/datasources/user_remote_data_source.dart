import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/user_dto.dart';
import '../../domain/entities/user.dart'; // User 엔티티 import
import '../mapper/user_mapper.dart'; // UserMapper import

abstract class UserRemoteDataSource {
  Future<User> login(String id, String password);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  // TODO: iOS 시뮬레이터의 경우 localhost, Android 에뮬레이터의 경우 10.0.2.2
  final String _baseUrl = 'http://10.0.2.2:3000';

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<User> login(String id, String password) async {
    final response = await client.get(Uri.parse('$_baseUrl/users'));

    if (response.statusCode == 200) {
      final List<dynamic> usersJson = json.decode(response.body);
      final userJson = usersJson.firstWhere(
        (user) => user['id'] == id && user['pwd'] == password,
        orElse: () => throw Exception('User not found or password mismatch'),
      );
      final userDto = UserDto.fromJson(userJson);
      return userDto.toModel();
    } else {
      throw Exception('Failed to load users');
    }
  }
}