
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String userCity,
    required String email,
    required String password,
    required String displayName,
    required String photoUrl,
    required int uid,
    required String createdTime,
    required String phoneNumber,
    required String bio,
    required bool isHost,
    required List<int> numberPropertyList,
    required List<int> numberActiveBookingsList,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}