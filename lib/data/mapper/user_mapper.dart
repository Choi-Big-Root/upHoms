// data/mapper/user_mapper.dart
import '../../domain/model/user/user_model.dart';
import '../dto/user/user_dto.dart';

class UserMapper {
  // UserModel -> UserDto 변환 (네트워크 요청 시)
  static UserDto toDto(UserModel model) {
    return UserDto(
      userCity: model.userCity?? '',
      email: model.email ?? '',
      password: model.password ?? '',
      displayName: model.displayName ?? '',
      photoUrl: model.photoUrl ?? '',
      uid: model.uid ?? -1,
      createdTime: model.createdTime ?? '',
      phoneNumber: model.phoneNumber ?? '',
      bio: model.bio ?? '',
      isHost: model.isHost ?? false,
      numberPropertyList: model.numberPropertyList ?? [],
      numberActiveBookingsList: model.numberActiveBookingsList ?? [],
    );
  }

  // UserDto -> UserModel 변환 (네트워크 응답 시, 이 예제에서는 사용되지 않지만 일반적으로 포함)
  static UserModel toModel(UserDto dto) {
    return UserModel(
      userCity: dto.userCity,
      email: dto.email,
      password: dto.password,
      displayName: dto.displayName,
      photoUrl: dto.photoUrl,
      uid: dto.uid,
      createdTime: dto.createdTime,
      phoneNumber: dto.phoneNumber,
      bio: dto.bio,
      isHost: dto.isHost,
      numberPropertyList: dto.numberPropertyList,
      numberActiveBookingsList: dto.numberActiveBookingsList,
    );
  }
}