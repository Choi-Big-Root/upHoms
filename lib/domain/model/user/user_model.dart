import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    String? userCity,
    String? email,
    String? password,
    String? displayName,
    String? photoUrl,
    int? uid,
    String? createdTime,
    String? phoneNumber,
    String? bio,
    bool? isHost,
    List<int>? numberPropertyList,
    List<int>? numberActiveBookingsList,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
