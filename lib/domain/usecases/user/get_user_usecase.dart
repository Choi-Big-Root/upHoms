import '../../model/user/user_model.dart';
import '../../repositories/user/user_repository.dart';

class GetUserUsecase{
  GetUserUsecase(this.userRepository);

  final UserRepository userRepository;


  Future<UserModel> call (UserModel user) async {
    return await userRepository.getUser(user);
  }
}