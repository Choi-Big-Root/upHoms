import '../../../domain/model/user/user_model.dart';

abstract class UserRemoteDataSource {
  Future<void> createUser(UserModel user);
  Future<void> getUser(UserModel user);
}