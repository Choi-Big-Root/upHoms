import '../../../domain/model/user/user_model.dart';

abstract class UserRemoteDataSource {
  Future<void> createUser(UserModel user);
  Future<UserModel> getUser(UserModel user);
  Future<UserModel> updateUser(UserModel user);
}