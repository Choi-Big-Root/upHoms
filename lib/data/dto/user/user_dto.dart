
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDto with _$UserDto {
  const factory UserDto({
    @Default('') String userCity,
    @Default('') String email,
    @Default('') String password,
    @Default('') String displayName,
    @Default('') String photoUrl,
    @Default(-1) int uid,
    @Default('') String createdTime,
    @Default('') String phoneNumber,
    @Default('') String bio,
    @Default(false) bool isHost,
    @Default([]) List<int> numberPropertyList,
    @Default([]) List<int> numberActiveBookingsList,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
}