import '../../domain/entities/user.dart';
import '../dto/user_dto.dart';

extension UserEx on UserDto {
  User toModel(){
    return User(id: id, name: name, profilePic: profilePic);
  }
}