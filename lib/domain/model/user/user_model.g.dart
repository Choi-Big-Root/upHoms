// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  userCity: json['userCity'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  displayName: json['displayName'] as String,
  photoUrl: json['photoUrl'] as String,
  uid: (json['uid'] as num).toInt(),
  createdTime: json['createdTime'] as String,
  phoneNumber: json['phoneNumber'] as String,
  bio: json['bio'] as String,
  isHost: json['isHost'] as bool,
  numberPropertyList: (json['numberPropertyList'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  numberActiveBookingsList: (json['numberActiveBookingsList'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
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
