import '../../model/user/user_model.dart';
import '../../repositories/user/user_repository.dart';

class GetUserUsecase{
  GetUserUsecase(this.userRepository);

  final UserRepository userRepository;


  Future<void> call (UserModel user) async {
    await userRepository.getUser(user);
  }
}