import '../../model/user/user_model.dart';

abstract class UserRepository {
  Future<void> createUser(UserModel user);
  Future<UserModel> getUser(UserModel user);
  Future<UserModel> updateUser(UserModel user);
}