// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDto _$UserDtoFromJson(Map<String, dynamic> json) => _UserDto(
  userCity: json['userCity'] as String? ?? '',
  email: json['email'] as String? ?? '',
  password: json['password'] as String? ?? '',
  displayName: json['displayName'] as String? ?? '',
  photoUrl: json['photoUrl'] as String? ?? '',
  uid: (json['uid'] as num?)?.toInt() ?? -1,
  createdTime: json['createdTime'] as String? ?? '',
  phoneNumber: json['phoneNumber'] as String? ?? '',
  bio: json['bio'] as String? ?? '',
  isHost: json['isHost'] as bool? ?? false,
  numberPropertyList:
      (json['numberPropertyList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  numberActiveBookingsList:
      (json['numberActiveBookingsList'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
);

Map<String, dynamic> _$UserDtoToJson(_UserDto instance) => <String, dynamic>{
  'userCity': instance.userCity,
  'email': instance.email,
  'password': instance.password,
  'displayName': instance.displayName,
  'photoUrl': instance.photoUrl,
  'uid': instance.uid,
  'createdTime': instance.createdTime,
  'phoneNumber': instance.phoneNumber,
  'bio': instance.bio,
  'isHost': instance.isHost,
  'numberPropertyList': instance.numberPropertyList,
  'numberActiveBookingsList': instance.numberActiveBookingsList,
};
