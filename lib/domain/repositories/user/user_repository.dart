import '../../model/user/user_model.dart';

abstract class UserRepository {
  Future<void> createUser(UserModel user);
}