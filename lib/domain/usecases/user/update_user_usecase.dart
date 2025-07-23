import '../../model/user/user_model.dart';
import '../../repositories/user/user_repository.dart';

class UpdateUserUsecase{
  UpdateUserUsecase(this.userRepository);

  final UserRepository userRepository;


  Future<UserModel> call (UserModel user) async {
    return await userRepository.updateUser(user);
  }
}