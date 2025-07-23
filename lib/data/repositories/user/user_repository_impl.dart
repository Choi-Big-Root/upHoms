import '../../../domain/model/user/user_model.dart';
import '../../../domain/repositories/user/user_repository.dart';
import '../../remote/user/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.remoteDataSource);
  final UserRemoteDataSource remoteDataSource; // RemoteDataSource 주입을 받고.

  @override
  Future<void> createUser(UserModel user) async {
    await remoteDataSource.createUser(user);
  }

  @override
  Future<UserModel> getUser(UserModel user) async {
    return await remoteDataSource.getUser(user);
  }

  @override
  Future<UserModel> updateUser(UserModel user) async {
    return await remoteDataSource.updateUser(user);
  }
}